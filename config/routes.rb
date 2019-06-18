Rails.application.routes.draw do
  resources :purchase, only: [:index, :show] do
    collection do
      post 'pay', to: 'purchase#pay'
    end
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


  resources :smses, only: :new

  resources :addresses, only: [:new, :edit, :update]

  resources :payments, only: [:new, :show]

  resources :closes, only: :new


  resources :users, only: [:new, :index, :show, :edit, :destroy]

  resources :profiles, only: [:index, :show, :edit] do
    collection do
      get 'edit_address'
    end
  end


  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
        get 'buy'
    end
  end

  resources :productitems, only: [:show]

  root 'products#index'

end
