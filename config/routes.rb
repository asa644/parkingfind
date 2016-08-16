Rails.application.routes.draw do

  resources :parking_spots
  get '/profile/:id' => 'users#show', as: :profile

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
