class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource

    if resource.save
      set_flash_message :notice, :signed_up
      store_location!
      sign_in_and_redirect(resource_name, resource)
    else
      clean_up_passwords(resource)
      store_location!
      flash[:alert] = resource.errors.full_messages.join(", ")
      redirect_to root_url
    end
  end

  protected
    def store_location!
      session[:"#{scope}_return_to"] = attempted_path if request.get? && !http_auth?
    end
end