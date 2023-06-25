class Admin::UsersController < ApplicationController
  def index
    
  end

  def show
    
  end
  
  def update
    
  end
  
  
  private


  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name, :profile_image, :is_banned)
  end
end
