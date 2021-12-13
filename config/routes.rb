Rails.application.routes.draw do
  devise_for :users
  resources :books
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :index, :update]
  get "home/about" => 'homes#about'
end
