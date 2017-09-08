class Api::V1::ListsController < ApplicationController

  def index
    lists = List.all
    render json: lists
  end

  def create
    list = List.create(list_params)
    project = Project.find(params[:project_id])
    project.lists << list
    render json: list
  end

  def show
    list = List.find_by(id: params[:id])
    listJson = {
      id:list.id,
      name: list.name,
      project_id: list.project_id,
      tasks: list.tasks
    }
    render json: listJson
  end

  def update
    list = List.find_by(id: params[:id])
    list.update(list_params)
    render json: list
  end

  def destroy
    list = List.find_by(id: params[:id])
    list.destroy
    lists = List.all
    render json: lists
  end

  private

  def list_params
    params.require(:list).permit(:name, :project_id, :positionX, :positionY)
  end

end
