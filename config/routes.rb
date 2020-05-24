Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'top#about'


  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :movies do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments,only: [:create]
  end


end