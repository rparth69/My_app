Rails.application.routes.draw do

  get 'sessions/new',to: 'sessions#new', as: 'login'
  post 'sessions/login' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :users, except: :index do
    resources :cities do
      resources :bookings
    end
  end

  resources :users, except: :index do
    get 'my_booking', to: 'users#my_booking'
    get 'cleaner_booking', to: 'users#cleaner_booking'
    resources :bookings
  end

  resources :cities
  root 'sessions#new'
  match '*unmatched_route', to: 'application#rescue_404', via: :all
end
