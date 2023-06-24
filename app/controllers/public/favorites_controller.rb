class Public::FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: currnent_user_id)
    @campgrounds = Campground.where(campground_id: @favorites.campground_id)
  end

  def create
    @campground = Campground.find(params[:campground_id])
    favorite = @campground.favorites.new(user_id: current_user.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @campground = Campground.find(params[:campground_id])
    favorite = @campground.favorites.find_by(user_id: current_user.id)
    if favorite.present?
        favorite.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
