class Flight < ApplicationRecord
  scope :unique_by_travel_date, -> { select('DISTINCT(travel_date)') }

  belongs_to :from_airport, :class_name => 'Airport'
  belongs_to :to_airport, :class_name => 'Airport'
  has_many :bookings

  def travel_date_formatted
    travel_date.strftime("%d/%m/%Y")
  end
end
