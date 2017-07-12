class UserSessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      @user.sessions << Session.new
      redirect_to user_path(@user)
    else
      redirect_to user_login_path
    end
  end

  def destroy
    User.find(session[:user_id]).sessions << Session.new(login:false)
    session[:user_id] = nil
    redirect_to root_path
  end


end