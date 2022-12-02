class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # if params[:query].present?
    #   sql_query = <<~SQL
    #     mushrooms.name ILIKE :query
    #   SQL
    #   @mushrooms = Mushroom.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @mushrooms = policy_scope(Mushroom)
    # end

    if params[:query].present?
      @mushrooms = Mushroom.where(category: "#{params[:query]}")
    else
      @mushrooms = policy_scope(Mushroom)
    end

    # if params[:trippy] == "Yes"
    #   @mushrooms = Mushroom.where(trippy: true)
    # else
    #   @mushrooms = policy_scope(Mushroom)
    # end

    # if params[:eatable] == "Yes"
    #   @mushrooms = Mushroom.where(eatable: true)
    # else
    #   @mushrooms = policy_scope(Mushroom)
    # end
  end
end
