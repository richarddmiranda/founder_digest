class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = current_user.projects.first
  end
end
