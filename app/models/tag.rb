class Tag < ApplicationRecord
  has_many :camptags, dependent: :destroy
  
end
