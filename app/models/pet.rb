class Pet < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :name, presence: true, uniqueness: true
  validates :price, :age, :size, presence: true
  validates :species, inclusion: { in: ['Mammal', 'Reptile', 'Bird', 'Fish', 'Amphibian', 'Insect'] }
end
