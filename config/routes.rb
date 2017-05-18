# frozen_string_literal: true
require "sidekiq/web"

Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  scope module: :organization do
    resources :accounts do
      scope module: :accounts do
        resources :connection_accounts, only: [:new, :show]
      end
    end
  end

  get '/auth/:provider/callback', to: 'connections#create'

  authenticate :user, -> (user) { user.admin? }do
    mount Sidekiq::Web, at: "sidekiq"
  end

end
