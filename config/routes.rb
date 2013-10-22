Initiapp::Application.routes.draw do
  resources :initiatives, path: '', only: [:index, :create, :show]

  devise_for :users, only: [:registrations]
end
