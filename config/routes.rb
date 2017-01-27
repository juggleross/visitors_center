Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "visitors#index"

  get "abilities", to:'application#abilities', defaults: {format: :json}
  get "categories", to:'application#categories', defaults: {format: :json}


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :visitors, only: [:index, :create, :destroy], defaults: {format: :json}
  
  resources :products, only: [:index, :create, :destroy], defaults: {format: :json}

  resources :moderations, only: [:index, :create, :destroy], defaults: {format: :json}
end