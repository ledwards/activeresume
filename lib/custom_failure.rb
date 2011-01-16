class CustomFailure < Devise::FailureApp
  def redirect_url
    new_user_session_path
  end

  # Redirect to root_url
  def respond
    if http_auth?
      http_auth
    else
      store_location!
      flash[:alert] = i18n_message unless flash[:notice]
      redirect_to "welcome#index"
    end
  end
end