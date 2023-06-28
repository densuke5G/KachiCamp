class Review < ApplicationRecord
  belongs_to :user
  belongs_to :campground

  validates :title, presence: true
  validates :body, presence: true
  validates :star, presence: true

end
