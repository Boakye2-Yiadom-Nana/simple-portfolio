Rails.application.routes.draw do
  get "users/new"
  get "users/create"
  resource :session
  resources :passwords, param: :token
  # Skills routes (full CRUD in one line)
  resources :skills

  # Projects routes (if you only want index + show)
  resources :projects, only: [:index, :show]

  resources :users, only: [:new, :create]



  # Static pages
  get "pages/home"
  get "pages/about"
  get "pages/contact"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root "pages#home"
end
