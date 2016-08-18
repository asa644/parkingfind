Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :parking_spots do
    resources :bookings
  end
  resources :bookings, only: [:index]
  get '/profile' => 'users#show', as: :profile

  get '/search' => 'parking_spots#search'

  resources :chat_rooms, only: [:new, :create, :show, :index]

  mount ActionCable.server => '/cable'

  # resource :users do
  #   resources :parking_spots do
  #     resources :bookings, only: [:new, :create, :show]
  #   end
  # end

end
