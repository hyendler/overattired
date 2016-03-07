Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions"}

  resources :users

  get "/admin", to: "admin/products#index"

  get :send_updates, to: 'admin/users#send_updates', as: :send_updates

  get :update_products_from_etsy, to: 'admin/products#update_products_from_etsy', as: :update_products_from_etsy

  get :privacy_policy, to: 'home#privacy_policy', as: :privacy_policy

  resources :products do
    resources :measurements
  end

  resources :users do
    resources :measurements
  end

  namespace :admin do
    resources :products
  end

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

end
