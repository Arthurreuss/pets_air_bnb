class Pet < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :price, :age, :size, presence: true
  validates :species, inclusion: { in: ['Elves', 'Reptile', 'Giants', 'Goblins', 'Amphibian', 'Dinasour'] }
  # validates :size, inclusion: { in: ['Atom', 'Pee', 'Football', 'House', 'Country', 'Earth'] }
  validates :address, presence: true
  validates :photo, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
