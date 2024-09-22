# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/index'
  get 'carts/create'
  get 'carts/destroy'
  resources :items, only: %i[index show]

  namespace :admin do
    resources :items, except: %i[show]
  end

  # 以下削除予定？
  resources :carts, only: %i[show create destroy]

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'items#index'
  post '/add_item/:item_id' => 'carts#add_item'
  get '/my_cart' => 'carts#my_cart'
  # Defines the root path route ("/")
  # root "articles#index"
end
