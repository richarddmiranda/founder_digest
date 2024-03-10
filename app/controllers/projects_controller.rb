class ProjectsController < ApplicationController

  def create
    current_user.projects.create!(project_params)
    redirect_to dashboard_index_path, notice: "Project was successfully created!"
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end