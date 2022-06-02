Rails.application.routes.draw do
  # default route / home page
  root to: 'pages#home'
  # user routes
  get 'signin', to: 'pages#signin', as: :signin
  get 'signup', to: 'pages#signup', as: :signup
  get 'profile', to: 'pages#profile'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :products, only: %i[index show] do
  #   collection do
  #     get :plates
  #     get :cutleries
  #     get :glasses
  #   end
  # end
  # resources :users, only: %i[show create new] do
  resources :products, only: %i[index create new show edit update] do
    collection do
      get :plates
      get :cutleries
      get :glasses
    end
    member do
      resources :bookings, only: %i[create new]
      resources :reviews, only: %i[show create new]
    end
  end
  resources :products, only: [:delete]
end
