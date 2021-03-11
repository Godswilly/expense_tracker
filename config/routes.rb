# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, only: %i[index new create show]
  resources :expenses, only: %i[index new create show]
  resources :users, except: [:destroy]
  root 'home#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'external', to: 'expenses#external'
end
