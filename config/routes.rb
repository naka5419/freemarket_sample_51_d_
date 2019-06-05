Rails.application.routes.draw do
  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
    end
  end
  devise_for :users
  resources :users, only: [:new, :index]
  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :products, only: [:index, :show, :new] do
    collection do
      get 'buy'
    end
  end
  root 'products#index'
end