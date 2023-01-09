# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resouce)
    user_path
  end
  
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end

end
