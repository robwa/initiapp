Initiapp::Application.routes.draw do
  resources :initiatives, path: '', only: [:index, :create, :show]

  resource :users, controller: 'devise/registrations', as: 'user_registration', only: [:create]
end
