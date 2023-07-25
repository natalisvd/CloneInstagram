class Story < ApplicationRecord
  belongs_to :user
  has_one_attached :images, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  validates :images, presence: true, blob: { content_type: :image}
end
