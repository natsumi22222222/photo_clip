class Admin::SessionsController < Devise::SessionsController
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?
protect_from_forgery

  def after_sign_in_path_for(resouce)
    admin_top_path
  end

  def after_sign_out_path_for(resouce)
    new_admin_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
  end

end
