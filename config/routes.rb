Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy, :new] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
end