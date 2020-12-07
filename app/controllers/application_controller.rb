class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後にリンクするページの設定
  def after_sign_in_path_for(resource)
    case resource
    when Hostuser
      hostuser_homes_top_path
    when Enduser
      enduser_path(current_enduser.id)
    end
  end

  #ログアウト後にリンクするページの設定
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email,:name,:nick_name,:introduction,:profile_image])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
  end

end