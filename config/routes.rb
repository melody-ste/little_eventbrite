Rails.application.routes.draw do
  root "events#index"
  
  resources :events
  resources :users
  
  get "up" => "rails/health#show", as: :rails_health_check
end

  
