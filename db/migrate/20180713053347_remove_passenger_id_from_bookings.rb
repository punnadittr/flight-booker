class RemovePassengerIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :passenger_id, :integer
  end
end
