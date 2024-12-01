Rails.application.routes.draw do
  # Use resourceful routing for todos (CRUD actions)
  resources :todos

  # Define health check route (optional)
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path (change this if you want the root to go elsewhere)
  root "todos#index"
end

