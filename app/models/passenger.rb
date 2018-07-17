class Passenger < ApplicationRecord
  belongs_to :booking
  validates :name, :email, presence: true

  def send_thankyou_email
    PassengerMailer.thankyou_email(self).deliver_now
  end
end
