Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  # get '/login', to: 'sessions#show'
  get 'welcome', to: 'sessions#welcome'
  post 'logout', to: 'sessions#destroy'
end
