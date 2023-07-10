class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reviews = Review.all
  end

  def search
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true)
  end
  
  def destroy
    review = Review.find(params[:id])

    review.destroy
    redirect_back fallback_location: root_path, notice:'削除完了しました'
  end
end
