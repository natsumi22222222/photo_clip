class ApplicationController < ActionController::Base
  before_action :ensure_current_user,{only:[:show, :edit,:update]}
  before_action :configure_permitted_parameters,
  if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def ensure_current_user
    @user= User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user)
    end
  end

end

