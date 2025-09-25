# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base

   helper_method :current_user, :user_signed_in?
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def user_signed_in?
    current_user.present?
  end
  
  def require_login
    redirect_to new_session_path unless user_signed_in?
  end
  
  helper_method :current_user, :user_signed_in?

  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
