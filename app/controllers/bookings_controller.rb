class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  # skip_after_action :verify_policy_scoped, only: :index
  before_action :set_booking, only: [ :show ]
  before_action :set_mushroom, only: [ :new, :create ]

  def index
    @bookings = current_user.bookings
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.mushroom = @mushroom
    if @booking.save
      redirect_to root_path, notice: 'Your MushROOM has been booked.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_mushroom
    @mushroom = Mushroom.find(params[:mushroom_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment, :mushroom_id, :user_id)
  end
end
