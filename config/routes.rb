Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :mushrooms, except: [:index]
end
