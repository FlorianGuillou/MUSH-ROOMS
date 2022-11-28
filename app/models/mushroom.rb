class Mushroom < ApplicationRecord
  has_many_attached :photos
  has_many :bookings
end
