# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  # get 'items', to: 'items#index'
  # get 'items/:id', to: 'items#show'
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'items#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
