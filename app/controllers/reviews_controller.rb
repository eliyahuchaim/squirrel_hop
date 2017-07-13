class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @response = Response.find(params[:response_id])
  end

  def create
    @review = Review.new(review_params)
    User.find(current_user).reviews << @review
    Response.find(params[:review][:response_id]).review = @review
    if @review.save
      redirect_to user_path(current_user)
    else
      redirect_to review_new_path
    end
  end


  private
  def review_params
    params.require(:review).permit(:description,:score)
  end
end
