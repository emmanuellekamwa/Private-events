Rails.application.routes.draw do
 
  root 'static_pages#home'
  match '/about', to: 'static_pages#about',     via: 'get'


  resources :users, only: [:new, :create, :show, :index]
  match '/signup',  to: 'users#new',            via: 'get'

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  resources :events, only: [:new, :create, :show, :index]


  resources :invites, only: [:create, :destroy]
  resources :users

end
