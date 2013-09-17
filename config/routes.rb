Initiative::Application.routes.draw do

  get "users/index"
  root 'users#index'

  devise_for :users

  resources :users, only: [:index]

end
