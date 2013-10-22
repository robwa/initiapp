Initiapp::Application.routes.draw do
  resources :initiatives, path: '', only: [:index, :create, :show] do
    # member do
    #   post '', action: :join, as: :join
    # end
  end

  #devise_for :users, only: [:registrations]
end
