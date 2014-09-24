Store::Application.routes.draw do
  devise_for :users
  resources :products
  resources :product_imports
  # root to: 'products#index'

  resources :sales
  resources :sale_imports
  root to: 'sales#index'
end
