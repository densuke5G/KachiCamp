class Public::CampgroundsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :map, :show]

  def new
    @campground = Campground.new
  end

  def index
    @campgrounds = Campground.all
  end

  def search
    @q = Campground.ransack(params[:q])
    @campgrounds = @q.result(distinct: true)
  end

  def map
  end

  def show
    @campground = Campground.find(params[:id])
    @campground_tags = @campground.tags
    @reviews = Review.where(campground_id: @campground.id)
  end

  def thanks
  end

  def status
    @campgrounds = Campground.where(user_id: current_user.id)
  end

  def create
    @campground = Campground.new(campground_params)
    @campground.user_id = current_user.id
    

    # タグを,で区切り配列にする
    tag_list = params[:campground][:tag_name].split(',')

    if @campground.save
      @campground.save_tag(tag_list)
      redirect_to campgrounds_path, notice:'投稿完了しました'
    else
      render:new
    end
  end


  private


  def campground_params
    params.require(:campground).permit(:user_id, :name, :description, :address, :latitude, :longitude, :phone_number, :business_hours,
    :check_in, :check_out, :station_line, :station_name, :station_walk, :busstop_line, :busstop_name, :busstop_walk, :rejection_reason,
    :camp_url, :rating, :is_confirmed, :image)
  end
end
