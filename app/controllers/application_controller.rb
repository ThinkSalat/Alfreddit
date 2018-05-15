class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :login, :logout, :logged_in?, :require_login!, :current_user, :auth_token
  
  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end
  
  def logout
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_login!
    redirect_to new_session_url unless logged_in?
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def auth_token
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>".html_safe
  end
end
