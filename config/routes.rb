Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :mushrooms do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]

  get "/my-Mush", to: "mushrooms#mushs"
end
