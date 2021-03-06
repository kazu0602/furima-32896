class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:encrypted_password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:given_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:given_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birth])
    #permitしないとカラムに保存されなくなる
  end
end
