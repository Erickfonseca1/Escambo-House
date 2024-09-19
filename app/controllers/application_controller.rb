class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the attributes that are allowed to be updated by the user
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name address])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name address])
  end
end
