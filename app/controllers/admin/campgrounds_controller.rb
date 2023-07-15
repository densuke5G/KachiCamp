class Admin::CampgroundsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @campground = Campground.new
  end

  def index
    @campgrounds = Campground.page(params[:page])

  end

  def show
    @campground = Campground.find(params[:id])
    @campground_tags = @campground.tags
  end

  def edit
    @campground = Campground.find(params[:id])
    @tag_list = @campground.tags.pluck(:tag_name).join(',')
  end

  def create
    @campground = Campground.new(campground_params)
    @campground.is_confirmed = 1

    # タグを,で区切り配列にする
    tag_list = params[:campground][:tag_name].split(',')

    if @campground.save
      @campground.save_tag(tag_list)
      redirect_to admin_campgrounds_path, notice:'投稿完了しました'
    else
      render:new
    end
  end

  def update
    @campground = Campground.find(params[:id])

    tag_list = params[:campground][:tag_name].split(',')

    if @campground.update(campground_params)
      # campground.idに紐付いたtagを削除する
      @old_relations = Camptag.where(campground_id: @campground.id)
      @old_relations.each do |relation|
        relation.delete
      end

      @campground.save_tag(tag_list)
      redirect_to admin_campground_path(@campground.id), notice:'編集完了しました'
    else
      render:edit
    end
  end

  def destroy
    Campground.find(params[:id]).destroy

    redirect_to admin_campgrounds_path
  end


  private

  def campground_params
    params.require(:campground).permit(:user_id, :name, :description, :address, :latitude, :longitude, :phone_number, :business_hours,
    :check_in, :check_out, :station_line, :station_name, :station_walk, :busstop_line, :busstop_name, :busstop_walk, :rejection_reason,
    :camp_url, :rating, :is_confirmed, :image)
  end
end
