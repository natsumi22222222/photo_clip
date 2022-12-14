class Genre < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many_attached :image

end
