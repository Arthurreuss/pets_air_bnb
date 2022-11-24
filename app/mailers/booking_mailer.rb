class BookingMailer < ApplicationMailer
  def create_confirmation
    @booking = params[:booking]

    mail(
      to:       @booking.user.email,
      subject:  "Booking created!"
    )
  end
end
