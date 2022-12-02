class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      sql_query = <<~SQL
      mushrooms.name @@ :query
    SQL
      @mushrooms = Mushroom.where(sql_query, query: "%#{params[:query]}%")
    else
    @mushrooms = policy_scope(Mushroom)
    end
  end
end
