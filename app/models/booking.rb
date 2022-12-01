class Booking < ApplicationRecord
  belongs_to :mushroom
  belongs_to :user
  has_many :reviews

  enum status: {
    pending: 0,
    active: 1,
    declined: 2
  }
end
