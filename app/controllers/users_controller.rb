class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def posts
    @posts = User.find(current_user).posts
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :street_address, :city, :state, :zip_code, :email, :phone)
  end

end
