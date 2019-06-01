Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new, :index]
  resources :cards, only: [:index, :edit, :update, :destroy]
  resources :products, only: [:index, :show, :new] do
    collection do
      get 'buy'
    end
  end
  root 'cards#index'
end
