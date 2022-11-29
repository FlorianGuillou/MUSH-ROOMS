class MushroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @mushroom = Mushroom.find(params[:id])
  end
end
