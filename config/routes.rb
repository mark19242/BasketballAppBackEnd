Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:create, :show, :update, :destroy]
  resources :training_sessions, only: [:create, :index, :show, :update, :destroy]
  resources :progresses, only: [:create, :index, :show, :update, :destroy]
end
