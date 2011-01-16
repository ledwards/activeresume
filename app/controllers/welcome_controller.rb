class WelcomeController < ApplicationController
  before_filter :redirect_logged_in_users
  
  def index
  end
  
  protected
  
  def redirect_logged_in_users
    redirect_to dashboard_path if current_user
  end

end
