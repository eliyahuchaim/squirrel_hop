class PostsController < ApplicationController
  before_action :user_logged_in?, only: [:new,:create,:destroy,:show]
  before_action :vendor_logged_in?, only: [:index]
  before_action :users_posts?, only: [:show]


  def index
    #Vendor sees all applicable gigs to him, but not the ones he already responded to
    all_services = Vendor.find(current_vendor).services.map {|service| service.id}
    @posts = Post.all.select do |post|
      all_services.include?(post.service_id) && !post.responses.map(&:vendor_id).include?(current_vendor)
    end
  end

  def new
    @post = Post.new
  end

  def show
    #If the user Accepted a response than he can only view that response
    #User can see his specific post and all responses to that post if not accepted response
    @post = Post.find(params[:id])
    @responses = accepted_responses
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

  def accepted_responses
    if !@post.responses.select(&:accepted).empty?
      @post.responses.select(&:accepted)
    else
      @post.order_responses_by_score
    end
  end

end
