Rails.application.routes.draw do
  root 'books#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index,:show, :edit, :update]
   get '/home/about' => 'books#about', as: :about
end