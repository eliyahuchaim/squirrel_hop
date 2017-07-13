class UsersController < ApplicationController

  before_action :user_logged_in?, only: [:show, :index]
  before_action :users_page?, :user_exists?, only: [:show]

  def index
    redirect_to user_path(current_user)
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
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    #should we do current_user in the find so it always goes to his page? Or leave it as params and check whether its his page
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
