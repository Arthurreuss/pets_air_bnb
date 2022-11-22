class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :start_date, :end_date, presence: true
  # validates_comparison_of :start_date, less_than: :end_date, greater_than_or_equal_to: -> { Date.today }
end
