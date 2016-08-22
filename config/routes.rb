Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :parking_spots do
    resources :bookings
  end

  resources :bookings, only: [:index] do
    member do
      get "rejected"
      get "accepted"
    end
      resource :chat_rooms, only: [:show]
      resources :reviews, only: [:new, :create]
  end

  get '/profile' => 'users#show', as: :profile
  get '/search' => 'parking_spots#search'
  mount ActionCable.server => '/cable'

end
