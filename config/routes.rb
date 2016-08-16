Rails.application.routes.draw do

  # get 'booking/index'

  # get 'booking/new'

  # get 'booking/create'

  # get 'booking/show'

  # get 'booking/edit'

  # get 'booking/update'

  # get 'booking/destroy'

  resources :parking_spots do
    resources :bookings, only: [:new, :create, :destroy]
  end
  get '/profile' => 'users#show', as: :profile


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
