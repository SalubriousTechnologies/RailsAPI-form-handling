Rails.application.routes.draw do
  resources :temp_users
  resources :sections
  resources :roles
  resources :users
  resources :doctors
  resources :centres
  post '/rails/active_storage/direct_uploads' => 'direct_uploads#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  put 'approve_user_profile/:id', to: 'temp_users#approve_user_profile'
end
