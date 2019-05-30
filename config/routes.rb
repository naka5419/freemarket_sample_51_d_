Rails.application.routes.draw do
  devise_for :users
  # root 'products#new'
  root 'users#index'
  resources :products, only: [:index, :show]

end
