TripcloudFinance::Application.routes.draw do
  root to: 'home#index'

  # Sidekiq Monitor
  # mount Sidekiq::Web, at: '/sidekiq'
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
  resources :invoices do
    collection do
      post 'search_result'
    end
  end
  resources :transactions do
    member do
      get "send_email"
    end
  end
  resources :bank_accounts
end
