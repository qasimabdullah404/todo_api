class Api::V1::UsersController < ApplicationController
	skip_before_action :authenticate_request!, only: [:create]

	def create
		user = User.new(user_params)
		if user.save
			render json: UserSerializer.new(user), status: :created
		else
      render json: { errors: user.errors.messages }, status: :unprocessable_entity
    end
	end

	private
		def user_params
			params.permit(:name, :username, :email, :password)
		end
end
