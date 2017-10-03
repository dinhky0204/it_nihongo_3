Rails.application.routes.draw do
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
  resources :users, only: :show

  root :to => "games#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
