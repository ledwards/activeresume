class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  load_and_authorize_resource
  skip_authorize_resource :only => [:show]

  def edit
    @profile = current_user.profile
  end
  
  def update
    @profile = current_user.profile

    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Profile updated successfully."
      redirect_to user_root_path
    else
      flash[:alert] = @profile.errors.full_messages.join("<br />").html_safe
      render :edit
    end
  end

end