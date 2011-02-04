class ProfilesController < ApplicationController

  def edit
    @profile = current_user.profile
  end
  
  def update
    if current_user.profile.update_attributes(params[:profile])
      redirect_to user_root_path
    else
      redirect_to :edit
    end
  end

end