class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @review = Review.new
    @user = current_user
    @bookings = @user.bookings
  end

  # def show
  #   @booking = Booking.find(params[:id])
  # end
end
