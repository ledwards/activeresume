class EmploymentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  load_and_authorize_resource
  skip_authorize_resource :only => [:show]
  
  def new
  end
  
  def create
    @employment.user_id = current_user.id

    if @employment.save
      flash[:notice] = "Employment record was successfully created."
      redirect_to dashboard_path
    else
      redirect_to new_employment_path
    end
  end
  
end
