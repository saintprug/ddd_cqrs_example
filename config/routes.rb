Rails.application.routes.draw do
  root 'dashboard#show'

  resources :accounts, only: [:index, :show, :new, :create] do
    member do
      post :deposit
      post :withdraw
      get :history
      get :balance
    end
  end

  mount RailsEventStore::Browser => '/res'
end
