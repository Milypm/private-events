Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users
  resources :sessions

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    delete '/logout' => :destroy
  end
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # get '/login', to: 'sessions#show'
  # delete '/destroy',  to: 'sessions#destroy'
  # get 'welcome', to: 'sessions#welcome'
  # post '/logout', to: 'sessions#destroy'
  # get '/logout', to: 'sessions#destroy'
end
