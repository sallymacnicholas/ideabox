Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :create, :show]
  resources :ideas
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
