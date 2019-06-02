Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  resources :users, only: [:new, :index] do
    resources :profiles do
      collection do
        get 'edit_address'
      end
    end
  end
=======
  resources :users, only: [:new, :index]
  resources :cards
>>>>>>> master
  resources :products, only: [:index, :show, :new] do
    collection do
      get 'buy'
    end
  end
  root 'cards#index'
end
