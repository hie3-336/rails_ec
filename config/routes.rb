# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/index'
  get 'carts/create'
  get 'carts/destroy'
  resources :items, only: %i[index show]

  namespace :admin do
    resources :items, except: %i[show]
  end

  resources :carts, only: %i[index create destroy]

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'items#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
