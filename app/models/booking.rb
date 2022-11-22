class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :reviews, dependent: :destroy


  validates :start_date, :end_date, presence: true
  # validates_comparison_of :start_date, less_than: :end_date, greater_than_or_equal_to: -> { Date.today }

  validate :validate_start_date

  private

  def validate_start_date
    if self.start_date < self.end_date && self.start_date >= Date.today
      return true
    elsif self.start_date < Date.today
      self.errors.add(:start_date, "Start date must be valid")
    elsif self.start_date > self.end_date
      self.errors.add(:end_date, "End date must be valid")
    end
  end
end
