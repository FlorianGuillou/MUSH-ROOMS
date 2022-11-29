class Mushroom < ApplicationRecord
  has_many_attached :photos
  has_many :bookings
  belongs_to :user

  validates :category, presence: true
  validates :color, presence: true
  validates :price, presence: true
end
