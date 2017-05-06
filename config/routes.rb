Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  namespace :organization do
    resources :accounts
  end

end
