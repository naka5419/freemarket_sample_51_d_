Rails.application.routes.draw do
  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
    end
  end
  devise_for :users

  devise_scope :user do
    get '/users/sign_up/sms' => 'users#sms', as: :users_registration_sms
    get '/users/sign_up/address' => 'users#address', as: :users_registration_address
    get '/users/sign_up/payment' => 'users#payment', as: :users_registration_payment
    get '/users/sign_up/close' => 'users#close', as: :users_registration_close
  end

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
