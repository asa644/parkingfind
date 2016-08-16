Rails.application.routes.draw do
  get 'parking_spots/index'

  get 'parking_spots/show'

  get 'parking_spots/new'

  get 'parking_spots/create'

  get 'parking_spots/edit'

  get 'parking_spots/update'

  get 'parking_spots/destroy'

  get '/profile/:id' => 'users#show', as: :profile

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
