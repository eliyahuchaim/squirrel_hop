class ResponsesController < ApplicationController
  before_action :vendor_logged_in?, only: [:new]
  #before action :vendor_or_user_logged_in?, only: [:destroy]
  #not sure why this is here JOE!!!! before_action :users_posts?, only: [:destroy]

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
    #If accepted from vendor it will destroy other responses
    #This isn't ideal since what happens if the guy is not good and he wants someone else instead?
    #The better way to implement is to hide all the rest
    #The problem is that we get to destroy from either the user or vendor and depending where you come is where you go

    if current_user
      if params[:accept]
        @response = Response.find(params[:id]).update(accepted:true)
        redirect_to user_path(current_user)
      else
        @response = Response.destroy(params[:id])
        redirect_to post_path(@response.post)
      end
    end
    if current_vendor
      @response = Response.destroy(params[:id])
      redirect_to vendor_path(current_vendor)
    end
  end

  private
  def response_params
    params.require(:response).permit(:title,:description,:price_quote)
  end

end
