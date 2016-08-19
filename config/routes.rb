Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/search' => 'parking_spots#search'

  resources :parking_spots do
    resources :bookings do
      resources :reviews, only: :create
    end
  end
  resources :bookings, only: [:index]
  get '/profile' => 'users#show', as: :profile

end
