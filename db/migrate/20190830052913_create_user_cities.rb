class CreateUserCities < ActiveRecord::Migration[5.2]
  def change
    create_table :users_cities do |t|
      t.references :city, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
