class BookingsController < ApplicationController
  # def new
  #   @pet = Pet.find(params[:pet_id])
  #   @booking = Booking.new
  #   # @movies = Movie.all
  #   # @movies = movies.map { |m| m.title }
  # end

  def create
    # raise
    # @movie = Movie.find(params[:movie_id])
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet

    if @booking.save
      redirect_to pet_path(@pet)
    else
      render pet_bookings_path, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to pet_path(@booking.pet)
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.save
      redirect_to pet_path(@pet)
    else
      render booking_path, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:pet_id, :start_date, :end_date, :total_price, :user_id)
  end
end
