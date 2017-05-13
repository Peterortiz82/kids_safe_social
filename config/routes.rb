Rails.application.routes.draw do

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
