Initiapp::Application.routes.draw do
  resources :initiatives, path: ''
  devise_for :users
end
