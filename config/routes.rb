Rails.application.routes.draw do
  resources :order_products
  resources :orders
  resources :products
  resources :product_categories
  resources :restaurantes
  resources :categories
  devise_for :users
  # Defines the root path route ("/")
  # root "home#index"
end
