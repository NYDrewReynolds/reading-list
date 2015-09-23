Rails.application.routes.draw do

  root 'welcome#index'

  resources :users
  resources :links

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
