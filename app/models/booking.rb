class Booking < ApplicationRecord
  belongs_to :mushroom
  belongs_to :user

  enum status: {
    pending: 0,
    approuver: 1,
    refuser: 2
  }
end
