Rails.application.routes.draw do
  root 'books#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :book_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show, :edit, :update]
   get '/home/about' => 'books#about', as: :about
end