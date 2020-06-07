class RemoveIndexFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_index :bookings, :date
  end
end
