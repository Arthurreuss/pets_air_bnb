Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard", as: "dashboard"
  get "dashboard_pets", to: "pages#dashboard_pets", as: "dashboard_pets"
  get "accept", to: "pages#status_true", as: "accept"
  get "decline", to: "pages#status_false", as: "decline"
  # Defines the root path route ("/")
  # root "articles#index"
  # get "/index", to: "pets#index"
  # get "/show/:id", to: "pets#show", as: pet_path
  # get "/index/new", to: "pets#new"
  # post "/index", to: "pets#create"
  # patch "/index/:id/edit", to: "pets#update", as: edit_pet_path
  # delete "/index/:id", to: "pets#destroy"

  # post "/bookings", to: "bookings#create"
  # delete "/bookings/:id", to: "bookings#destroy"
  resources :bookings, only: %i[destroy update] do
    resources :reviews, only: %i[new create]
  end
  resources :pets do
    resources :bookings, only: %i[create]
  end



  # resources :users, only: %i[create update destroy]
end
