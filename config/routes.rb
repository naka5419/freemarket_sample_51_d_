Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new, :index] do
    resources :profiles do
      collection do
        get 'edit_address'
      end
    end
  end
  resources :products, only: [:index, :show, :new] do
    collection do
      get 'buy'
    end
  end
  root 'products#index'
end
