class FlightsController < ApplicationController
  include FlightsHelper

  def index
    unless params[:Flight].nil?
      search_flight
      show_not_found_message if no_flights && !same_airports?
    end
    all_airport_names
    if same_airports?
      flash.now[:danger] = "Destination and Arrival cannot be the same"
    end
  end
end