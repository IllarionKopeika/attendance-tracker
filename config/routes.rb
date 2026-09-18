Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "pages#dashboard"

  # sessions
  resource :session, only: :create
  get "login", to: "sessions#new", as: "login"
  delete "logout", to: "sessions#destroy", as: "logout"

  # groups
  resources :groups, only: [ :index, :new, :create ]

  # students
  resources :students, only: [ :index, :show, :new, :create, :edit, :update ]

  # courses
  resources :courses, only: [ :index, :show, :new, :create ]
end
