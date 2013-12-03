Initiapp::Application.routes.draw do
  # /users
  devise_for :users, controllers: { confirmations: "users/confirmations" }
  devise_scope :user do
    patch "users/confirmation" => "users/confirmations#confirm", as: :confirm_user_confirmation
  end

  # /...
  resources :initiatives, path: '', only: [:index, :create, :show] do
    # /...
    post '', action: :join, as: :join, on: :member
    # /.../topics
    resources :topics, only: [:create, :show]
  end
end
