Rails.application.routes.draw do
  get 'order/index'
  get 'order/create'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :order, only: [:index, :create]
  end
end
