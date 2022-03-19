class RootController < ApplicationController
  def index
    render json: { message: "Rate limited API calls to a Todos app. Make CRUD requests to /api/v1/todos" }
  end
end