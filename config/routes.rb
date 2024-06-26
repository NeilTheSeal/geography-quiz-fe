Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  get "/oauth2callback" => "sessions#create"
  post "/signin" => "sessions#new"
  get "/signout" => "sessions#destroy"
  get "/dashboard" => "dashboard#index"
  get "/quiz" => "quiz#index"
  post "/quiz" => "quiz#create"
  get "active",  to: "sessions#active"
  get "timeout", to: "sessions#timeout"
  get "/login" => "home#index"
  get "/is-user-valid" => "users#user_valid"
end
