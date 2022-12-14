Rails.application.routes.draw do
  # get 'reviews/new'
  # get 'reviews/create'
  devise_for :users
  root to: "pages#home"
  resources :mushrooms do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index update edit update] do
    resources :reviews, only: %i[new create]
  end

  get "/my-Mush", to: "mushrooms#mushs"
end
