class MushroomsController < ApplicationController
  def show
    @mushroom = Mushroom.find(params[:id])
    authorize @mushroom
  end
end
