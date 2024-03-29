# frozen_string_literal: true

class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resouce)
    admin_top_path
  end

  def after_sign_out_path_for(resouce)
    new_admin_session_path
  end


  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end


end
