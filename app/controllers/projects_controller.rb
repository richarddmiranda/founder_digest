class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def update
    # current_user.projects.create!(project_params)
    @project.update!(project_params)
    redirect_to dashboard_index_path, notice: "Project was successfully created!"
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end