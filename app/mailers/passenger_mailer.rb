class PassengerMailer < ApplicationMailer
  default from: 'noreply@ptflight_booker.com'

  def thankyou_email(passenger)
    @passenger = passenger
    @booking = @passenger.booking
    mail(to: @passenger.email, subject: 'Welcome!')
  end
end
