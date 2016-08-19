Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :parking_spots do
    resources :bookings do
      resources :reviews, only: :create
    end
  end

  resources :bookings, only: [:index] do
      resource :chat_rooms, only: [:show]
  end

  get '/profile' => 'users#show', as: :profile
  get '/search' => 'parking_spots#search'
  mount ActionCable.server => '/cable'

end
