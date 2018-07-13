class ChangeDurationToBeIntegerInFlights < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :duration, :integer
  end
end
