class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username full_name phone_number])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username full_name phone_number profile_picture bio private])
  end
end
