Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :order, only: [:index, :create]
    resources :messages, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end
