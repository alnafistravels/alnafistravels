class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(username: params[:session][:username]).first

    if user && user.password == params[:session][:password]
      session[:user_id]  = user.id
      redirect_to sites_staff_login_path
    else
      flash[:danger] = "Invalid Credentials"
      redirect_to sites_staff_login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logged_out] = "You have logged out"
    redirect_to root_path
  end

end
