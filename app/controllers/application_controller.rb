class ApplicationController < ActionController::Base
  # ログインしていないユーザーをログインページの画面に促す
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :first_name, :first_name_reading, :name, :name_reading, :birth ])
  end

end
