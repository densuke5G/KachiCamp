class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @reviews = Review.where(user_id: current_user.id)
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.campground_id = params[:review][:campground_id]

    if @review.save
      redirect_to campground_path(review.campground_id), notice:'投稿完了しました'
    else
      render :new
    end

  end



  private


  def review_params
    params.require(:review).permit(:user_id, :campground_id, :title, :body, :star)
  end
end
