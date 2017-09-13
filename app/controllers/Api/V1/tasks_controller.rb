class Api::V1::TasksController < ApplicationController

  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    task = Task.create(task_params)
    list = List.find(params[:list_id])
    list.tasks << task
    render json: task
  end

  def show
    task = Task.find_by(id: params[:id])
    tasksJson = {
      completed: task.completed,
      id: task.id,
      description:task.description,
      list_id: task.list_id,
      name: task.name,
      positionX: task.positionX,
      positionY: task.positionY,
      users: task.users
    }
    render json: tasksJson
  end

  def add_user
    task = Task.find_by(id: params[:id])
    user = User.find(params[:user_id])
    task.users << user
    render json: user
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update(task_params)
    render json: task
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    tasks = Task.all
    render json: tasks
  end

  private

  def task_params
    params.require(:task).permit(:name, :list_id, :description, :positionX, :positionY)
  end

end
