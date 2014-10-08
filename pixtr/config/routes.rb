Rails.application.routes.draw do
  root "galleries#index"
  resources :galleries do
    resources :images, except: [:index]
  end
end
