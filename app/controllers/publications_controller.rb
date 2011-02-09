class PublicationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  load_and_authorize_resource
  skip_authorize_resource :only => [:show]

  def new
  end

  def create
    @publication.user_id = current_user.id

    if @publication.save
      flash[:notice] = "Publication successfully created."
      redirect_to dashboard_path
    else
      flash[:alert] = @publication.errors.full_messages.join("<br />").html_safe
      render :new
    end
  end
end
