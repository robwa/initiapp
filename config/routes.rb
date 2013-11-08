Initiapp::Application.routes.draw do
  devise_for :users, controllers: { confirmations: "users/confirmations" }
  devise_scope :user do
    patch "users/confirmation" => "users/confirmations#confirm", as: :confirm_user_confirmation
  end

  resources :initiatives, path: '', only: [:index, :create, :show] do
    member do
      post '', action: :join, as: :join
    end

    resources :texts, only: [:create]
  end
end
