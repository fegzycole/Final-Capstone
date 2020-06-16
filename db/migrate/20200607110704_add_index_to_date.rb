class AddIndexToDate < ActiveRecord::Migration[6.0]
  def change
    add_index :bookings, :date, unique: true
  end
end
