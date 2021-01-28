Rails.application.routes.draw do
  root to: 'study_times#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :study_times
end
