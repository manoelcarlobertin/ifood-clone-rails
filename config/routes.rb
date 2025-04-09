Rails.application.routes.draw do
  root "restaurantes#index"

  devise_for :users

  resources :restaurantes, only: [ :index, :show,  :new, :create ]
  resources :categories, only: [ :index ]
  resources :products, only: [ :index, :show ]
  resources :orders, only: [ :new, :create, :show, :index ]

  resources :carrinho, only: [ :index ] do
    collection do
      get :add_item
      get :remove_item
      get :clear
    end
  end

  resources :available_cities, only: [ :index ]
end
