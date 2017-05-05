Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  resource :organization do
    get :index
    resource :accounts
  end

end
