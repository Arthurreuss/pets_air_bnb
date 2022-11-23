class Pet < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo


  validates :name, presence: true, uniqueness: true
  validates :price, :age, :size, presence: true
  validates :species, inclusion: { in: ['Mammal', 'Reptile', 'Bird', 'Fish', 'Amphibian', 'Insect'] }
  
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
