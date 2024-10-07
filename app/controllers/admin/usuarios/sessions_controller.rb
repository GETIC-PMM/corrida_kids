# frozen_string_literal: true

class Admin::Usuarios::SessionsController < Devise::SessionsController
  before_action :destroy, only: [:after_sign_up_path_for ]
  before_action :create, only: [:after_sign_in_path_for ]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def after_sign_out_path_for(resource_or_scope)
    new_usuario_session_path
  end

  def after_sign_out_path_for(resource_or_scope)
    admin_root_path
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
