class Public::UsersController < ApplicationController
  def show
    @favorites = Favorite.where(user_id: current_user.id)
    # @campgrounds = Campground.where(id: @favorites.campground_id)
  end

  def edit
  end
end
