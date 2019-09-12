class User < ApplicationRecord
  has_many :bookings
  has_many :cities
  has_and_belongs_to_many :cities, join_table: 'users_cities'
  enum user_type: { customer: 0, cleaner: 1 }
  validates_uniqueness_of :phone_number,length: { minimum: 10 }
end
