Rails.application.routes.draw do
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
