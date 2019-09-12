Rails.application.routes.draw do

  get 'sessions/new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'city/index'
  resources :users do
    resources :cities do
      resources :bookings
    end
  end

  resources :users do
    get 'my_booking', to: 'users#my_booking'
    resources :bookings
  end

  resources :users do
    resources :bookings
  end
  resources :users do
    get 'cleaner_booking', to: 'users#cleaner_booking'
  end
  resources :cities
  root 'sessions#new'
end
