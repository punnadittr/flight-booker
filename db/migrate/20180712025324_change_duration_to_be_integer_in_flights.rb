class ChangeDurationToBeIntegerInFlights < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :duration, 'integer USING CAST(column_name AS integer)'
  end
end
