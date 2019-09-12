class AddBookingsTocity < ActiveRecord::Migration[5.2]
  def change
     add_reference :cities, :bookings, foreign_key: true 
  end
end
