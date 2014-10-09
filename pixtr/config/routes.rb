Rails.application.routes.draw do

  resources :users
  resource :sessions, only: [:new, :create, :destroy]

  root "galleries#index"
  resources :galleries do
    resources :images, except: [:index]
  end
end
