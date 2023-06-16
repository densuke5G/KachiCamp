class Admin::CampgroundsController < ApplicationController
  def new
    @campground = Campground.new
  end

  def index
    @campgrounds = Campground.all
  end

  def show
  end

  def edit
  end

  def create
    campground = Campground.new(campground_params)

    campground.save
    redirect_to admin_campgrounds_path
  end


  def campground_params
    params.require(:campground).permit(:user_id, :name, :description, :address, :latitude, :longitude, :phone_number, :business_hours,
    :check_in, :check_out, :station_line, :station_name, :station_walk, :busstop_line, :busstop_name, :busstop_walk, :rejection_reason, :is_confirmed, image: [])
  end
end
