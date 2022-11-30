Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tours, only: %i[new create] do
    resources :tour_users, only: %i[new create]
  end

  resources :tours, except: %i[new create] do
    resources :sites, only: %i[new create]
  end

  resources :sites, only: %i[show edit update] do
    resources :notes, only: %i[new create]
  end

  resources :notes, only: %i[edit update]
  resources :tour_users, only: :destroy

end
