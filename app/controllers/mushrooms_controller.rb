class MushroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @mushroom = Mushroom.find(params[:id])
  end

  def new
    @mushroom = Mushroom.new
  end

  def create
    @mushroom = Mushroom.new(mushroom_params)
    if @mushroom.save
      redirect_to root_path, notice: 'MushRoom was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    raise
  end

  def update
    raise
  end

  def destroy
    @mushroom = Mushroom.find(params[:id])
    @mushroom.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def mushroom_params
    params.require(:mushroom).permit(:category, :color, :price, :description, :photo, :address, :name)
  end
end
