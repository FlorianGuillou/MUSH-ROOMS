class Booking < ApplicationRecord
  belongs_to :mushroom
  belongs_to :user
  has_many :reviews

  enum status: {
    pending: 0,
    approuver: 1,
    refuser: 2
  }
end
