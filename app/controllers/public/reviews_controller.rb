class Public::ReviewsController < ApplicationController
  before_action :authenticate_user! 
  
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
    # Cloud Natural Language APIの結果を保存
    @review.score = Language.get_data(review_params[:body])

    if @review.save
      redirect_to campground_path(@review.campground_id), notice:'投稿完了しました'
    else
      render :new
    end

  end



  private


  def review_params
    params.require(:review).permit(:user_id, :campground_id, :title, :body, :star)
  end
end
