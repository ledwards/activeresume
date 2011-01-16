class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  include Devise::Controllers::InternalHelpers
  include Devise::Controllers::Helpers
  
  # GET /users/sign_up
  def new
    build_resource({})
    redirect_to root_url
  end
  
  # POST /users/sign_up
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
  
  # GET /resource/edit
  def edit
    render_with_scope :edit
  end

  # PUT /resource
  def update
    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    set_flash_message :notice, :destroyed
    sign_out_and_redirect(self.resource)
  end

  protected

    def authenticate_scope!
      send(:"authenticate_#{resource_name}!")
      self.resource = resource_class.find(send(:"current_#{resource_name}").id)
    end
  
    def i18n_message(default = nil)
      message = warden.message || :unauthenticated

      if message.is_a?(Symbol)
        I18n.t(:"#{scope}.#{message}", :resource_name => scope,
               :scope => "devise.failure", :default => [message, message.to_s])
      else
        message.to_s
      end
    end

    def redirect_url
      send(:"new_#{scope}_session_path")
    end

    def http_auth?
      !Devise.navigational_formats.include?(request.format.to_sym) || (request.xhr? && Devise.http_authenticatable_on_xhr)
    end

    def http_auth_body
      method = :"to_#{request.format.to_sym}"
      {}.respond_to?(method) ? { :error => i18n_message }.send(method) : i18n_message
    end

    def recall_controller
      "#{params[:controller].camelize}Controller".constantize
    end

    def warden
      env['warden']
    end

    def warden_options
      env['warden.options']
    end

    def scope
      @scope ||= warden_options[:scope]
    end

    def attempted_path
      warden_options[:attempted_path]
    end

    def store_location!
      session[:"#{scope}_return_to"] = attempted_path if request.get? && !http_auth?
    end
end