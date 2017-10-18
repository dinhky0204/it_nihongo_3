Rails.application.routes.draw do
  resources :review_comments
  get 'static_pages/home'
  get 'static_pages/help'
  resources :reviews, only: [:index, :show, :create, :edit, :update, :destroy]
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :games
  resources :genres
  resources :publishers
  devise_for :users, controllers: {
      registrations: 'users/registrations',
  }
  resources :users, except: [:edit] do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resource  :notifications, only: [:update]
  root :to => "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'rates' => 'rate#index'
  post 'rate' => 'rate#update'

  # for notifications
  mount ActionCable.server => '/cable'
  if Rails.env.development?
    default_url_options :host => "localhost:3000"
  end
end
