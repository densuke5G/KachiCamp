class Public::UsersController < ApplicationController
  def show
  end

  def useredit
  end

  def favorite
    @favorites = Favorite.where(user_id: current_user.id)
    # @campgrounds = Campground.where(id: @favorites.campground_id)
  end

  def update
    if current_user.update(user_params)
      redirect_back fallback_location: root_path
    else
      render:edit
    end
  end


  private


  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name, :profile_image, :is_banned)
  end
end
