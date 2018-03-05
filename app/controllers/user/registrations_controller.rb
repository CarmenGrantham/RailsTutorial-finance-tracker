class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  
  
  protected
  
  def configure_permitted_parameters
    # Allow first_name and last_name to be processed in sign up and update actions
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:accout_update, keys: [:first_name, :last_name])
  end
end