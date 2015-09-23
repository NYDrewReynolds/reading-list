Rails.application.routes.draw do

  root 'sessions#create'

  resources :users
end
