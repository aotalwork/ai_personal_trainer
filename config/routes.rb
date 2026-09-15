Rails.application.routes.draw do
  root "dashboard#index"

  resource :profile, only: [:show, :edit, :update]

  resources :assessments, only: [:index, :new, :create]

  resources :plans, only: [:index, :show]

  resources :workouts, only: [:index, :show]

  resources :meals, only: [:index, :show]

  resources :exports, only: [:create]

  namespace :google do
    resource :calendar, only: [:show, :create]
  end


end