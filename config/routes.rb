# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/index'
  get 'carts/create'
  get 'carts/destroy'
  resources :items, only: %i[index show]

  namespace :admin do
    resources :items, except: %i[show]
  end

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'items#index'
  post '/add_item/:item_id', to: 'carts#add_item', as: :add_item
  get '/my_cart', to: 'carts#my_cart'
  get '/delete_cart', to: 'carts#delete_cart'
  # Defines the root path route ("/")
  # root "articles#index"
end
