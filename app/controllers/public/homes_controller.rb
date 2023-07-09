class Public::HomesController < ApplicationController
  def top
    @campgrounds = Campground.all
  end
end
