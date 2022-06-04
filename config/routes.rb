Rails.application.routes.draw do
  devise_for :users
  # default route / home page
  root to: 'pages#home'
  # user routes
  get 'signin', to: 'pages#signin', as: :signin

  get 'signup', to: 'pages#signup', as: :signup
  post 'signup', to: 'users#create'

  get 'profile', to: 'pages#profile'

  resources :products do
    collection do
      get :sets
      get :plates
      get :cutleries
      get :glasses
    end
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: [:destroy]
end
