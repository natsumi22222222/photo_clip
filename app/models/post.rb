class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags,through: :post_tags
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [300, 300]).processed
  end

  def tags_save(tag_list)
    if self.tags != nil
      post_tags_records= PostTag.where(post_id: self.id)
      post_tags_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag= Tag.where(name: tag).first_or_create
      self.tags << inspected_tag
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
