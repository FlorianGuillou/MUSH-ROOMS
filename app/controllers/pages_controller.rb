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

    # if params[:eatable].present?
    #   sql_eatable = <<~SQL
    #   mushrooms.eatable ILIKE :eatable
    # SQL
    #   @mushrooms = Mushroom.where(sql_eatable, eatable: "%#{params[:eatable]}%")
    # else
    #   @mushrooms = policy_scope(Mushroom)
    # end
  end
end
