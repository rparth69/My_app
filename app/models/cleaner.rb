class Cleaner < ApplicationRecord
  has_many :bookings
  has_and_belongs_to_many :cities, join_table: 'cleaners_cities'
  accepts_nested_attributes_for :cities
end
