Rails.application.routes.draw do

  root 'products#index'

  resources :amazon_api, only: [:index]

  resources :products do
    resources :reviews, only: [:create, :new]
    collection do
      get 'about'
      get 'aboutme'
      get 'myprojects'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
