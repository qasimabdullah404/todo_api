class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  def throttle
    client_ip = request.env["REMOTE_ADDR"]
    key = "count:#{client_ip}"
    count = REDIS.get(key)

    unless count
      REDIS.set(key, 0)
      REDIS.expire(key, THROTTLE_TIME_WINDOW)
      return true
    end

    render json: {"message":"You have reached the requests limit. Please wait for some time."}, status: 429 if count.to_i >= THROTTLE_MAX_REQUESTS
    REDIS.incr(key)
    true
  end

  private
    def authenticate_request
      header = request.headers["Authorization"]
      header = header.split(' ').last if header

      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    end
end
