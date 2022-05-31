Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :projects do
    resources :steps, only: [:new, :create]
    resources :documents, only: [:create]
  end

  resources :steps, only: [:show] do
    resources :tasks, only: [:create]
  end

  resources :steps, only: [:edit, :update, :destroy]
  resources :documents, only: [:destroy]
  resources :tasks, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
