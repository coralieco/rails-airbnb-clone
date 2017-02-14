Rails.application.routes.draw do
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"

  devise_for :users
  resources :beds do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :destroy, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
