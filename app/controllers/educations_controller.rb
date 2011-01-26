class EducationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  load_and_authorize_resource
  skip_authorize_resource :only => [:show]
  
  def new
  end
  
  def create
    @education.user_id = current_user.id

    if @education.save
      flash[:notice] = "Education record was successfully created."
      redirect_to dashboard_path
    else
      redirect_to new_education_path
    end
  end
  
end
