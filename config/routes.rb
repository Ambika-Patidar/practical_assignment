Rails.application.routes.draw do
  resources :books
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  resources :home, only: :index
  resources :users, only: :index
  resources :authors, only: [:new, :index, :create]

  # Defines the root path route ("/")
  root 'home#index'
end
