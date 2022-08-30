Rails.application.routes.draw do
  resources :books, only: %i[new index create] do
    collection do
      get :reports
    end
  end
  resources :categories, only: %i[new index create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :home, only: :index
  resources :users, only: :index
  resources :authors, only: %i[new index create]

  mount API::Base, at: '/api'
  # Defines the root path route ("/")
  root 'home#index'
end
