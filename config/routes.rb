# config/routes.rb

Rails.application.routes.draw do
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

    resources :stores
    resources :schools
    resources :administrators
  end

  namespace :schoolboard do
    root to: "home#show"
    resource :home
    resources :sessions, only: [:new, :create, :destroy]
    resources :password_resets, except: [:show, :destroy, :index]
    get "login", to: "sessions#new", as: "login"
    get "logout", to: "sessions#destroy", as: "logout"

    resource :school
    resources :stores

    resources :receipts do
      collection do
        get :pending
        get :conflict
        get :rejected
      end
    end
  end

  namespace :storeboard do
    root to: "home#show"
    resource :home
    resources :sessions, only: [:new, :create, :destroy]
    resources :password_resets, except: [:show, :destroy, :index]
    get "login", to: "sessions#new", as: "login"
    get "logout", to: "sessions#destroy", as: "logout"
  end
end
