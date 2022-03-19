class Api::V1::TodosController < ApplicationController
  def index
    todos = Todo.all
    render json: TodoSerializer.new(todos), status: :ok
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: TodoSerializer.new(todo), status: :created
    else
      render json: { errors: todo.errors.messages }, status: :unprocessable_entity
    end
  end

  def show
    begin
      todo = Todo.find(params[:id])
      render json: TodoSerializer.new(todo), status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "Todo task not found!" }, status: :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: TodoSerializer.new(todo), status: :ok
    else
      render json: { errors: todo.errors.messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "Todo task not found!" }, status: :unprocessable_entity
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      head :no_content
    else
      render json: { errors: "An error occured, couldn't delete todo." }, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:task, :task_completed)
  end
end
