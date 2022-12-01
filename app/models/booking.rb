class Booking < ApplicationRecord
  belongs_to :mushroom
  belongs_to :user

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }
end
