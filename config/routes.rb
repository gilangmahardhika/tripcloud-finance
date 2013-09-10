TripcloudFinance::Application.routes.draw do
  root to: 'home#index'
  resources :home do
    collection do
      post 'login'
      get 'logout'
      delete 'logout'
    end
  end
  resources :airlines
  resources :admin_users
  resources :dashboard
  resources :cities
  resources :customers
  resources :invoices
end
