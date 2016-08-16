Rails.application.routes.draw do

  root to: 'pages#home'

  resources :parking_spots do
    resources :bookings, only: [:new, :create, :destroy]
  end

  get '/profile' => 'users#show', as: :profile

  resources :users, only: [:show] do
    resources :parking_spots, only: [:show]
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end
