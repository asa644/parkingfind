Rails.application.routes.draw do

  get 'payments/new'

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :notifications, only: [ :destroy, :index ]

  resources :parking_spots do
    resources :bookings do
      resources :payments, only: [:new, :create]
    end
  end

  resources :bookings, only: [:index] do
    member do
      get "rejected"
      get 'accepted' => 'payments#accepted'
    end
      resource :chat_rooms, only: [:show]
      resources :reviews, only: [:new, :create]
  end

  get '/management' => 'users#management'
  get '/profile' => 'users#show', as: :profile
  get '/search' => 'parking_spots#search'
  mount ActionCable.server => '/cable'

end
