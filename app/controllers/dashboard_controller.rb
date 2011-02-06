class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @employments = current_user.employments
    @educations = current_user.educations
    @projects = current_user.projects
  end

end
