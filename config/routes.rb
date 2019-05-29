Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  # root 'user#new'
  resources :products, only: [:index, :show]
  
end
