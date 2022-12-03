class ApplicationController < ActionController::Base
  add_flash_types :success, :fail

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:invalid_user] = "You must be a Staff to access these pages"
      redirect_to root_path
    end
  end
end
