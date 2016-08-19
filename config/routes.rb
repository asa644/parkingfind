Rails.application.routes.draw do

  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/search' => 'parking_spots#search'

  resources :parking_spots do
    resources :bookings
  end
  resources :bookings, only: [:index]
  get '/profile' => 'users#show', as: :profile

  # resource :users do
  #   resources :parking_spots do
  #     resources :bookings, only: [:new, :create, :show]
  #   end
  # end

end
