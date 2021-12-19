class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :current_user

  def current_user
    Current.user
  end

  def set_current_user
    # finds user with session data and stores it if present
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    # allows only logged in user
    redirect_to new_session_path, alert: 'You must be signed in' if current_user.nil?
  end
end
