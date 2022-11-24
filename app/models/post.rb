class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags,through: :post_tags
  has_many :favorites, dependent: :destroy
  has_one_attached :image



end
