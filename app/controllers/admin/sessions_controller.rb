# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
# before_action :configure_permitted_parameters, if: :devise_controller?

#     def after_sign_in_path_for(resouce)
#       root_path
#     end

#     def after_sign_out_path_for(resouce)
#       new_admin_session_path
#     end

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
#   end

end
