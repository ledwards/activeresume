class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  load_and_authorize_resource
  skip_authorize_resource :only => [:show]
    
  def new
  end
  
  def create
    @project.user_id = current_user.id
    if @project.save
      redirect_to root_path
    else
      redirect_to new_project_path
    end
  end

end