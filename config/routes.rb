Rails.application.routes.draw do
  devise_for :admins
  
  # Admin Dashboard
  namespace :admin_panel do
    root to: 'dashboard#index', as: :dashboard
    
    resources :projects
    resources :blogs
    resources :events
    resources :leadership_profiles
    resource :about_page, only: [:edit, :update]
    resource :homepage_content, only: [:edit, :update]
    resource :contact_info, only: [:edit, :update]
    resources :admins
  end
  
  # Public API Routes
  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index, :show]
      resources :blogs, only: [:index, :show]
      resources :events, only: [:index, :show]
      resources :leadership_profiles, only: [:index]
      
      # Page content endpoints
      get 'about', to: 'pages#about'
      get 'contact', to: 'pages#contact'
      get 'homepage', to: 'pages#homepage'
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "admin_panel/dashboard#index"
end
