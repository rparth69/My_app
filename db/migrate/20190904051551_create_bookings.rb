class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.bigint :cleaner_id
      t.references :users, foreign_key: true
    end
  end
end
