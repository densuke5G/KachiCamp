class Campground < ApplicationRecord
  has_many :reviews
  has_many :favorites
  has_many :camptags

  belongs_to :user, optional: true

  enum is_confirmed: {pending: 0, confirmed: 1, rejected: 2}

  has_many_attached :image


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
