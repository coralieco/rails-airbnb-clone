Rails.application.routes.draw do
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"

  devise_for :users
  resources :beds do
    resources :bookings, only: [:create]

  end
  resources :bookings, only: [:index, :show, :destroy, :update] do
      resources :reviews, only: [:create, :index, :show]
    end

  namespace :my do
    resources :beds, only: [:index]
    resources :bookings, only: [:index, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

