class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :automobile_id
      t.string :city
      t.datetime :date
      t.text :notes

      t.timestamps
    end
  end
end
