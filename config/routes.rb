Rails.application.routes.draw do
  get 'savings/index'
  get 'savings/show'
  get 'savings/new'
  get 'savings/edit'
  get 'savings/create'
  get 'savings/update'
  get 'savings/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/dashboard", to: "pages#dashboard"
  get "/suggestions", to: "pages#suggestions"

  resources :accounts do
    resources :transactions
  end

  resources :savings do
    resources :transactions
  end

  resources :learning_materials
end
