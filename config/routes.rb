Rails.application.routes.draw do
  root "bands#index"

  resources :bands, only: [:index, :show]
  resources :band_reps, only: [:new, :create]
end
