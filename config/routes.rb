Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  
  resources :events
  resources :users, only: [:show, :edit, :update, :destroy]
  
  get "up" => "rails/health#show", as: :rails_health_check
end

  
