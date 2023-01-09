# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
     user_path(@user.id)
   end

   def after_sign_out_path_for(resource)
     root_path
   end

  def create
　　@user = login(params[:email], params[:password])
　　if @user
      redirect_back_or_to root_path, success: t('.create.success')
　　else
　　　flash.now[:danger] = t('.create.fail')
 　　　render :new
　　end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end
end
