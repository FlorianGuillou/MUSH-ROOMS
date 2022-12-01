class Booking < ApplicationRecord
  belongs_to :mushroom
  belongs_to :user
  has_many :reviews
end
