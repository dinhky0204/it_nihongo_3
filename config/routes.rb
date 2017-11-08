Rails.application.routes.draw do

  get 'admin/dashboard'
  get 'admin/genres'
  post 'admin/genre_delete'
  post 'admin/genre_add'
  post 'admin/genre_update'
  post 'admin/publisher_delete'
  post 'admin/publisher_add'
  post 'admin/publisher_update'
  get 'admin/publishers'
  get 'admin/games'
  get 'admin/create_game'
  post 'admin/game_delete'
  
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/genre_top'
  
  get 'home_page/index'
  get 'home_page/genre_top'

  resources :review_comments

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
  resource  :notifications, only: [:update] do
    post "seen_notification"
  end
  root :to => "home_page#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'rates' => 'rate#index'
  post 'rate' => 'rate#update'
  post 'search' => 'search#search'

  # for notifications
  mount ActionCable.server => '/cable'
  if Rails.env.development?
    default_url_options :host => "localhost:3000"
  end
end
