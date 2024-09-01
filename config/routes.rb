# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items, only: %i[index show]

  namespace :admin do
    resources :items, only: %i[index create new edit update destroy]
  end

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'items#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
