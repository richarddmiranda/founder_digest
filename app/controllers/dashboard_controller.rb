class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = current_user.default_project
    @other_projects = Project.except(@project).ready
  end
end
