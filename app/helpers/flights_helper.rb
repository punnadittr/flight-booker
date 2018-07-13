module FlightsHelper
  def show_not_found_message
    flash.now[:info] = 'Flight not found on the selected date'
  end

  def search_flight
    if Rails.env.development?
      development_search_case
    else
      production_search_case
    end
  end

  def development_search_case
    @flights = Flight.where('to_airport_id = ? AND 
      from_airport_id = ? AND
      travel_date = ? AND
      to_airport_id != from_airport_id', 
      params[:to_airport], 
      params[:from_airport],
      params[:Flight][:travel_date].to_date)
  end

  def production_search_case
    @flights = Flight.where('to_airport_id = ? AND 
      from_airport_id = ? AND
      travel_date = ? AND
      to_airport_id != from_airport_id', 
      params[:to_airport], 
      params[:from_airport],
      params[:Flight][:travel_date].in_time_zone)
  end

  def no_flights
    @flights.count == 0
  end

  def all_airport_names
    @airport_options = Airport.all.map { |a| [ a.name, a.id ]}
  end

  def same_airports?
    params[:to_airport].class == String && params[:to_airport] == params[:from_airport]
  end
end
