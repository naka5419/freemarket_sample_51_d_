Rails.application.routes.draw do
  devise_for :users
  # root 'products#new'
  root 'users#index'
  resources :products, only: [:index, :show]
  resources :users, only: [:index, :edit, :update]

  devise_scope :user do
    get '/users/sign_up/sms' => 'users#sms', as: :users_registration_sms
    get '/users/sign_up/address' => 'users#address', as: :users_registration_address
    get '/users/sign_up/payment' => 'users#payment', as: :users_registration_payment
    get '/users/sign_up/close' => 'users#close', as: :users_registration_close
  end
end
