Rails.application.routes.draw do
  root 'movies#index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :movies
  resources :genres, only: [:new, :create, :index, :edit, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :comments

end