Rails.application.routes.draw do
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
end