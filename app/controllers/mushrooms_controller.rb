class MushroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show


  def show
    @mushroom = Mushroom.find(params[:id])
    authorize @mushroom
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
    authorize @mushroom
  end

  def update
    authorize @mushroom
  end

  def destroy
    @mushroom = Mushroom.find(params[:id])
    authorize @mushroom
    @mushroom.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def mushroom_params
    params.require(:mushroom).permit(:category, :color, :price, :description, :photo, :address, :name)
  end
end
