Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show create new] do
    resources :products, only: %i[index create new show edit update]
    member do
      resources :bookings, only: %i[index show create new]
      resources :reviews, only: %i[show create new]
    end
  end
  resources :products, only: [:delete]
end
