# frozen_string_literal: true

class Hostusers::SessionsController < Devise::SessionsController
  layout 'hostuser'
  
  # ゲストログイン機能
  def new_guest
    @hostuser = Hostuser.guest
    sign_in @hostuser
    redirect_to hostuser_homes_top_path, notice: 'ゲストユーザーとしてログインしました。(管理者側)'
  end
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
