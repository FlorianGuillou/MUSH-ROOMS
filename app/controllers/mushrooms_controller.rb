class MushroomsController < ApplicationController
  def show
    @mushroom = Mushroom.find(params[:id])
  end
end
