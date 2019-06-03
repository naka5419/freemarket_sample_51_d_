Rails.application.routes.draw do
  devise_for :users
  # root 'products#new'
  root 'users#sms'
  resources :products, only: [:index, :show]
  resources :users, only: [:index, :edit, :update]

  devise_scope :user do
    # get 'login' => 'users/sing_up/sms', as: :new_user_session
    get '/users/sign_up/sms' => 'users#sms', as: :users_registration_sms
    get '/users/sign_up/address' => 'users#address', as: :users_registration_address
    get '/users/sign_up/payment' => 'users#payment', as: :users_registration_payment
    get '/users/sign_up/close' => 'users#close', as: :users_registration_close
    # get 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end
end
