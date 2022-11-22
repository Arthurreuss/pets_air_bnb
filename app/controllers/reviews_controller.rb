class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end


  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking

    respond_to do |format|
      if @review.save
        format.html { redirect_to dashboard_path, notice: "Review saved" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
