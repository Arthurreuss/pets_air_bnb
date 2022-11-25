class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end

  def dashboard
    # @review = Review.new
    @user = current_user
    @bookings = @user.bookings
  end

  def dashboard_pets
    @user = current_user
    @pets = @user.pets
    # @bookings = @pets.map { |pet| pet.bookings }
  end

  def status_true
    @booking = Booking.find(params[:booking_id])
    @booking.update({ status: true })
    @booking.save
    redirect_to dashboard_pets_path
  end

  def status_false
    @booking = Booking.find(params[:booking_id])
    @booking.update({ status: false })
    @booking.save
    redirect_to dashboard_pets_path
  end
  # def show
  #   @booking = Booking.find(params[:id])
  # end
end
