class PostsController < ApplicationController
  before_action :user_logged_in?, only: [:new,:create,:destroy]
  before_action :vendor_logged_in?, only: [:show]

  def new
    @post = Post.new
  end

  def show
    #Vendor sees all applicable vendors to him
    all_services = Vendor.find(current_vendor).services.map {|service| service.id}
    @posts = Post.all.select do |post|
      all_services.include?(post.service_id)
    end
  end

  def create
    @post = Post.new(post_params)
    User.find(session[:user_id]).posts << @post
    redirect_to user_path(current_user)
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_to user_path(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:service_id, :title, :description, :min_price, :max_price)
  end

end
