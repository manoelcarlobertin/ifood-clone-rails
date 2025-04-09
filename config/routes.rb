Rails.application.routes.draw do
  get "carrinho/index"
  get "carrinho/add_item"
  get "carrinho/remove_item"
  get "carrinho/clear"
  resources :pratos
  resources :order_products
  resources :orders
  resources :products
  resources :product_categories
  resources :restaurantes, only: [ :index, :show ]
  resources :categories
  devise_for :users
  # Defines the root path route ("/")
  # root "home#index"
end
