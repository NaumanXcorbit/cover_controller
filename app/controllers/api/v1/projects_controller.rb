class Api::V1::ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render :'api/v1/projects/index', status: 200
  end
  def show
    @project = Project.find_by(id:params[:id])
  end
end
