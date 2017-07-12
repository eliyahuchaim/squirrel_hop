class ResponsesController < ApplicationController
  before_action :vendor_logged_in?, only: [:new,:destroy]
  before_action :users_posts?, only: [:destroy]

  def new
    @response = Response.new
    Post.find(params[:post_id]).responses << @response
  end

  def create
    @response = Response.new(response_params)
    Post.find(params[:response][:post]).responses << @response
    Vendor.find(current_vendor).responses << @response
    if @response.save
      redirect_to vendor_path(current_vendor)
    else
      redirect_to posts_path
    end
  end

  def destroy
    @response = Response.destroy(params[:id])
    redirect_to vendor_path(current_vendor)
  end

  private
  def response_params
    params.require(:response).permit(:title,:description,:price_quote)
  end

end
