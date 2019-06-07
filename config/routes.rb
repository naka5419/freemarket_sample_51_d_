Rails.application.routes.draw do
  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
    end
  end
  devise_for :users

  resources :smses, only: :new

  resources :addresses, only: :new

  resources :payments, only: :new

  resources :closes, only: :new

  resources :users, only: [:new, :index, :show, :edit, :destroy] do
    resources :profiles do
      collection do
        get 'edit_address'
      end
    end
  end

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
