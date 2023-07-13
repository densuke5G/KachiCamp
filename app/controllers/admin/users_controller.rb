class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      # ユーザーのレビューを削除
      @user.reviews.destroy_all
      flash[:notice] = "編集完了しました"
      redirect_to admin_user_path(user)
    else
      render :show
    end
  end


  private


  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name, :profile_image, :is_banned)
  end
end
