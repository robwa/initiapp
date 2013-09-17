Initiative::Application.routes.draw do

  root 'users#index'

  devise_for :users

  resources :users, only: [:index]

end
