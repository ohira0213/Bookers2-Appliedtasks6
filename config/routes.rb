Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy, :new]
  resources :users, only: [:index, :show, :edit, :update]
  #resources :user_registrations
  #resources :user_sessions
end