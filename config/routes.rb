# config/routes.rb

Rails.application.routes.draw do
  namespace :adminboard do
    resources :administrators
  end
  root to: "home#show"
  resource :home

  namespace :adminboard do
    root to: "home#show"
    resource :home
    resources :legal
    resource :branding
    resources :sessions, only: [:new, :create, :destroy]
    resources :password_resets, except: [:show, :destroy, :index]
    get "login", to: "sessions#new", as: "login"
    get "logout", to: "sessions#destroy", as: "logout"
  end
end
