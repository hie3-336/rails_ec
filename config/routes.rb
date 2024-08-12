# frozen_string_literal: true

Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'items#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
