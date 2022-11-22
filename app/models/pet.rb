class Pet < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
