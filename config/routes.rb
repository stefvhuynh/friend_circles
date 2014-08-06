Rails.application.routes.draw do
  resource :session, only: [:create, :new, :destroy]
  resources :posts, only: [:create, :new, :show]
  resources :circles, only: [:create, :edit, :update, :new, :destroy]
  resource :user, only: [:create, :new, :update, :edit] do
    get "feed", on: :member
    resources :circles, only: [:index, :show]
  end
end
