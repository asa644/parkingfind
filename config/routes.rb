Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :parking_spots do
    resources :bookings, only: [:new, :create, :destroy]
  end

  get '/profile' => 'users#show', as: :profile

  resource :users, only: [:show] do
    resources :parking_spots do
      resources :bookings, only: [:new, :create, :show]
    end
  end

end
