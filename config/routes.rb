Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users,
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  namespace :admin do
    resources :categories, except: [:show]
  end
  resources :categories, only: [:index, :show]
end
