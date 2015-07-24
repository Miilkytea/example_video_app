Rails.application.routes.draw do
  root "bands#index"

  resources :bands, only: [:index, :show]
  resources :band_reps, only: [:new, :create]

  get "/login", to: "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  # this can be a "singular" resource, since there is 
  # only one per user. the controller is still plural
end
