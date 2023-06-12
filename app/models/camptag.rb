class Camptag < ApplicationRecord
  belongs_to :campground
  belongs_to :tag
  
end
