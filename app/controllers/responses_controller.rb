class ResponsesController < ApplicationController

  def new
    @response = Response.new
    Post.find(params[:post_id]).responses << @response
  end

  def create
    @response = Response.new(response_params)
    Vendor.find(current_vendor).responses << @response
    if @response.save
      redirect_to vendor_path(current_vendor)
    else
      redirect_to new_response_path
    end
  end

  def destroy

  end

  private
  def response_params
    params.require(:response).permit(:title,:description,:price_quote)
  end
end
