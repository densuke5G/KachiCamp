class Public::CampgroundsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :map, :show]
  before_action :confirm_post, only: [:show]

  def new
    @campground = Campground.new
  end

  def index
    @campgrounds = Campground.page(params[:page]).per(3)
  end

  def search
    @q = Campground.ransack(params[:q])
    @campgrounds = @q.result(distinct: true).page(params[:page]).per(3)
  end

  def map
    @campgrounds = Campground.all
  end

  def show
    @campground = Campground.find(params[:id])
    @campground_tags = @campground.tags
    @reviews = Review.where(campground_id: @campground.id).page(params[:page]).per(2)
  end

  def thanks
  end

  def status
    @campgrounds = Campground.where(user_id: current_user.id).page(params[:page])
  end

  def create
    @campground = Campground.new(campground_params)
    @campground.user_id = current_user.id


    # タグを,で区切り配列にする
    tag_list = params[:campground][:tag_name].split(',')

    if @campground.save
      @campground.save_tag(tag_list)
      redirect_to thanks_campgrounds_path, notice:'投稿完了しました'
    else
      render:new
    end
  end


  private


  # 非公開の投稿がURL直打ちで見られることを防ぐ
  def confirm_post
    campground = Campground.find(params[:id])
    unless campground.confirmed?
      redirect_to root_path, notice:'非公開の投稿は閲覧できません'
    end
  end


  def campground_params
    params.require(:campground).permit(:user_id, :name, :description, :address, :latitude, :longitude, :phone_number, :business_hours,
    :check_in, :check_out, :station_line, :station_name, :station_walk, :busstop_line, :busstop_name, :busstop_walk, :rejection_reason,
    :camp_url, :rating, :is_confirmed, :image)
  end
end
