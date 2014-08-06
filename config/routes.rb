Rails.application.routes.draw do
  resource :session, only: [:create, :new, :destroy]
  resources :circles, only: [:create, :edit, :update, :new, :destroy]

  resource :user, only: [:create, :new, :update, :edit] do
    get "feed", on: :member
    resources :circles, only: [:index, :show]
  end

  resources :posts, only: [:create, :new, :show] do
    resources :comments, only: :create
  end
end
