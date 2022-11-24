class BookingsController < ApplicationController
  # def new
  #   @pet = Pet.find(params[:pet_id])
  #   @booking = Booking.new
  #   # @movies = Movie.all
  #   # @movies = movies.map { |m| m.title }
  # end

  def create
    # @movie = Movie.find(params[:movie_id])
    id = params[:pet_id]
    @pet = Pet.find(id)
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    @booking.total_price = @pet.price * (@booking.end_date - @booking.start_date)

    if @booking.save
      # mail = BookingMailer.with(booking: @booking).create_confirmation.deliver_now
      # mail.deliver_now
      redirect_to dashboard_path
    else
      render "pets/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to dashboard_path
  end

  # def update
  #   @booking = Booking.find(params[:id])

  #   if @booking.save
  #     redirect_to pet_path(@pet)
  #   else
  #     render booking_path, status: :unprocessable_entity
  #   end
  # end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end
end
