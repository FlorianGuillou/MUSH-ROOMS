class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review

    if @review.save
      redirect_to root_path, notice: "Thank you, your review has been completed! Come back to smurf with us!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
