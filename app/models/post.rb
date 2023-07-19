class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_many :likers, through: :likes, source: :user

  validates :images, presence: true, blob: { content_type: :image}

end
