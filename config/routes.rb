Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  
  resources :events do
    get 'attendances_index', on: :member
  end
  resources :users, only: [:show, :edit, :update, :destroy] do 
    post 'avatars', to: 'users#upload_avatar', as: :avatars
  end
  post 'checkout', to: 'checkout#create'
  get 'checkout/success', to: 'checkout#success'
  
  # get "up" => "rails/health#show", as: :rails_health_check
end

  
