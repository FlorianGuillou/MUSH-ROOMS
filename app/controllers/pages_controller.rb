class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      sql_query = <<~SQL
      mushrooms.name ILIKE :query
    SQL
      @mushrooms = Mushroom.where(sql_query, query: "%#{params[:query]}%")
    else
    @mushrooms = policy_scope(Mushroom)
    end

    # # if params[:query].present?
    # # #   sql_query = <<~SQL
    # # #   mushrooms.category :query
    # # # SQL
    # #   @mushrooms=Mushroom.all
    # #   raise
    # #   # @mushrooms = Mushroom.find_by_category("%#{params[:query]}%")

    # # else
    # #   @mushrooms = policy_scope(Mushroom)
    # #   raise
    # end
  end
end
