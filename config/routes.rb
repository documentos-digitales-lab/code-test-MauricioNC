Rails.application.routes.draw do
  resources :customers, only: [:new, :create, :show, :update]
  resources :products, only: [:index, :new, :create, :show]

  # Defines the root path route ("/")
  root "customers#new"

end
