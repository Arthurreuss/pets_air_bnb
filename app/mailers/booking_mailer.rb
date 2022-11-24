class BookingMailer < ApplicationMailer
  default from: "animalkingdom919@gmail.com"
  layout "mailer"

  def create_confirmation
    @booking = params[:booking]
    mail(to: @booking.email, subject: "Booking created!")
  end
end
