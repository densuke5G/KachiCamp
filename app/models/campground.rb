class Campground < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :camptags, dependent: :destroy
  has_many :tags, through: :camptags

  belongs_to :user, optional: true

  enum is_confirmed: {pending: 0, confirmed: 1, rejected: 2}

  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["address", "business_hours", "busstop_line", "busstop_name", "busstop_walk", "camp_url", "check_in", "check_out", "created_at", "description", "id", "is_confirmed", "latitude", "longitude", "name", "phone_number", "rating", "rejection_reason", "station_line", "station_name", "station_walk", "updated_at", "user_id"]
  end

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewtagとする
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete　Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
