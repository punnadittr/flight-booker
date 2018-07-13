class AddTimeToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :time, :time
  end
end
