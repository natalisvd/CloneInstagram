class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :images, presence: true, blob: { content_type: :image }
end
