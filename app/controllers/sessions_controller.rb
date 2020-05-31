class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  skip_before_action :authorized_admin
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      
      render "new", alert: "Logged in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end