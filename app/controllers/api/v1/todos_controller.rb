class Api::V1::TodosController < ApplicationController
  def index
    todos = Todo.all
    render json: TodoSerializer.new(todos), status: :ok
  end
end
