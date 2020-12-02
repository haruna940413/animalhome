# frozen_string_literal: true

class Endusers::SessionsController < Devise::SessionsController
  layout 'enduser'
  
  def new_guest
    @enduser = Enduser.guest
    sign_in @enduser
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
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
