class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = current_user.projects.first
    @other_projects = Project.all
  end
end
