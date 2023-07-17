class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def favorite
    @favorites = Favorite.where(user_id: current_user.id).page(params[:page]).per(3)
    # @campgrounds = Campground.where(id: @favorites.campground_id)
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path, notice:'編集完了しました'
    else
      render 'edit'
    end
  end


  private


  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name, :profile_image, :is_banned)
  end
end
