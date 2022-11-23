class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, :comment, presence: true
  validates :rating, numericality: { in: 1..5 }
  validates :rating, numericality: { only_integer: true }
end
