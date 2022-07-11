require "jwt"

module JsonWebToken
	extend ActiveSupport::Concern

	def jwt_encode payload, exp = 1.day.from_now
		payload[:exp] = exp.to_i
		JWT.encode(payload, ENV['JWT_SECRET'])
	end

	def jwt_decode token
		if token
			decoded = JWT.decode(token, ENV['JWT_SECRET'])[0]
			HashWithIndifferentAccess.new decoded
		else
			"Access Denied"
		end
	end
end