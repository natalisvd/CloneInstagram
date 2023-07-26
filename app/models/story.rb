class Story < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  validates :image, presence: true, blob: { content_type: :image }
end
