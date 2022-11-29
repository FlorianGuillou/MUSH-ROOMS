class PagesController < ApplicationController
  def home
    @mushrooms = Mushroom.all
  end
end
