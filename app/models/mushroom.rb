class Mushroom < ApplicationRecord
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  belongs_to :user

  validates :category, presence: true
  validates :color, presence: true
  validates :price, presence: true
end
