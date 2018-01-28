Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # User routes
  get '/users/index', to: 'users#index'
  get '/users/:id', to: 'users#getUserByIndex'

  # Profile routes
  get '/profile/index', to: 'profile#index'
  get '/profile/:id', to: 'profile#getByUserId'
  post '/profile/create', to: 'profile#create'
end
