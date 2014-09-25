Store::Application.routes.draw do
  devise_for :users

  resources :sales
  get "sales/log_file/:log_file_id", to: "sales#index"
  resources :sale_imports
  root to: 'sales#index'
end
