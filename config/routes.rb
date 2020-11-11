Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, only: %I[index new create show]
  resources :expenses, only: %I[index new create show]
  resources :users, except: [:destroy]
  root 'home#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
