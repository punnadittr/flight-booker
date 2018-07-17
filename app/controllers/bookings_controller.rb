class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.passengers.build
    @selected_flight ||= Flight.find_by(id: params[:flight_id])
    @tickets = params[:tickets]
    @passenger_numbers = @tickets.to_i
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
      @booking.passengers.each do |p|
        p.send_thankyou_email
      end
    else
      flash[:danger] = 'Please enter valid information and try again'
      redirect_to root_path  
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :tickets, :passengers_attributes => [:name, :email])
  end
end
