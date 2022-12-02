class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  # skip_after_action :verify_policy_scoped, only: :index
  before_action :set_booking, only: [:show, :update, :edit]
  before_action :set_mushroom, only: [:new, :create, :show]

  def index
    @bookings = Booking.where(user: current_user)
    authorize @bookings
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
      redirect_to root_path, notice: 'Ask for hosting sent!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
    @user = User.find(@booking.user_id)
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
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
    params.require(:booking).permit(:start_date, :end_date, :comment, :mushroom_id, :user_id, :status)
  end
end
