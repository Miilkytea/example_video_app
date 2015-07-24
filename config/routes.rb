Rails.application.routes.draw do
  root "bands#index"

  resources :bands, only: [:index, :show] do
    # has many within a belongs to, when you want to know both
    # can be "nested": 
    # http://guides.rubyonrails.org/routing.html#nested-resources
    resources :music_videos, only: [:new, :create, :destroy]
  end
  resources :band_reps, only: [:new, :create]

  get "/login", to: "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  # this can be a "singular" resource, since there is 
  # only one per user. the controller is still plural
end
