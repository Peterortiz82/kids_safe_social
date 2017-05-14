# frozen_string_literal: true
require "sidekiq/web"

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  devise_scope :user do
    get '/sign_out',  :to => 'sessions#destroy'
  end

  root 'home#index'

  namespace :organization do
    resources :accounts do
      scope module: :accounts do
        resources :connection_accounts, only: [:new, :create, :show]
      end
    end
  end

end
