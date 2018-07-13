class ChangeDatetimeToDateForFlights < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :travel_date, :date
  end
end
