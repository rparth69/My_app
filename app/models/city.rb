class City < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'users_cities'
end
