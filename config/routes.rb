Rails.application.routes.draw do
  get 'reviews/create'

  root 'products#index'
  resources :products
  resources :amazon_api, only: [:index]
  resources :reviews, only: [:create, :new, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
