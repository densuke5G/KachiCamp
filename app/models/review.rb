class Review < ApplicationRecord
  belongs_to :user
  belongs_to :campground

  validates :title, presence: true
  validates :body, presence: true
  validates :star, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["body", "campground_id", "created_at", "id", "score", "star", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["campground", "user"]
  end

end
