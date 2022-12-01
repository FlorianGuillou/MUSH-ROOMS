class MushroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_mushroom, only: %i[show edit update destroy]

  def mushs
    @mushrooms = Mushroom.where(user: current_user)
    @bookings = Booking.where(mushroom_id: @mushrooms)
    authorize @mushrooms
  end

  def show
  end

  def new
    @mushroom = Mushroom.new
    authorize @mushroom
  end

  def create
    @mushroom = Mushroom.new(mushroom_params)
    @mushroom.user = current_user
    authorize @mushroom
    if @mushroom.save
      redirect_to root_path, notice: 'MushRoom was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @mushroom.update(edit_mushroom_params)
      if params[:mushroom][:photos].present?
        params[:mushroom][:photos].each do |photo|
          @mushroom.photos.attach(photo)
        end
      end
      redirect_to @mushroom, notice: "Your MushRoom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mushroom.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:id])
    authorize @mushroom
  end

  def edit_mushroom_params
    params.require(:mushroom).permit(:category, :color, :price, :description, :address, :name, :trippy, :eatable)
  end

  def mushroom_params
    params.require(:mushroom).permit(:category, :color, :price, :description, :address, :name, :trippy, photos:[])
  end
end
