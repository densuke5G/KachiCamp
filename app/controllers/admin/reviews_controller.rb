class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def destroy
    review = Review.find(params[:id])

    review.destroy
    redirect_back fallback_location: root_path
  end
end
