Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users,
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  namespace :admin do
    resources :categories, except: [:show]
    resources :words
  end
  resources :categories, only: [:index, :show]

  resources :notifications do
    member do
      patch "checked"
    end
  end
end
