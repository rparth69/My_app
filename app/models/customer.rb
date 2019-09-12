class Customer < ApplicationRecord
  has_many :bookings
  has_many :cities
  validates_uniqueness_of :phone_number,length: { minimum: 10 }
end
