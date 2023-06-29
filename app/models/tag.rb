class Tag < ApplicationRecord
  has_many :camptags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts,through: :post_tags

  validates :tag_name, uniqueness: true, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["tag_name"]
  end

end
