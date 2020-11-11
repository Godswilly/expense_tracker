Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, only: %I[index new create show]
  resources :expenses, only: %I[index new create]
  resources :users, only: [:create]
  root 'home#index'
end
