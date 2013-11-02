Initiapp::Application.routes.draw do
  devise_for :users

  resources :initiatives, path: '', only: [:index, :create, :show] do
    member do
      post '', action: :join, as: :join
    end
  end
end
