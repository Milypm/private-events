Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
