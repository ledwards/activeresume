class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @employments = current_user.employments
    @educations = current_user.educations
    @portfolio_items = current_user.portfolio_items
  end

end
