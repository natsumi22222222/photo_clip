class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags,through: :post_tags
  has_many :favorites, dependent: :destroy
  has_one_attached :image

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

end
