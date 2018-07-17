class PassengerMailer < ApplicationMailer
  default from: 'noreply@xcvdsvsdf.com'

  def thankyou_email(passenger)
    @passenger = passenger
    @booking = @passenger.booking
    mail(to: @passenger.email, subject: 'Welcome!')
  end
end
