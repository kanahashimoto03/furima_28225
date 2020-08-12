class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :password_confirmation, :family_name, :last_name, :family_name_reading, :last_name_reading, :birthday])
  end
end
