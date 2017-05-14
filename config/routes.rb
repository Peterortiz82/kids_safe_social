# frozen_string_literal: true
require "sidekiq/web"

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'

  devise_for :users

  namespace :organization do
    resources :accounts do
      scope module: :accounts do
        resources :connection_accounts, only: [:new, :create, :show]
      end
    end
  end

end
