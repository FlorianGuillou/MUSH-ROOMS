class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy

  validates :rating, inclusion: { in: 1..5 }
  validates :comment, presence: true
  validates :conmment, length: { minimum: 8 }
end
