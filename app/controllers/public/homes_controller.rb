class Public::HomesController < ApplicationController
  def top
    @campgrounds = Campground.where(is_confirmed: 1).joins(:reviews).group("campground_id").order("avg(star) desc").limit(3)
  end
end
