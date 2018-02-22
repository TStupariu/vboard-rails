Rails.application.routes.draw do
  resources :rooms
  mount_devise_token_auth_for 'User', at: 'auth'
  # User routes
  get '/users/index', to: 'users#index'
  get '/users/:id', to: 'users#getUserByIndex'

  # Profile routes
  get '/profile/index', to: 'profile#index'
  get '/profile/:email', to: 'profile#getByUserId'
  post '/profile/create', to: 'profile#create'
  post '/profile/update', to: 'profile#update'

  # Rooms routes
  get '/room/index', to: 'rooms#index'
  get '/room/publicRooms', to: 'rooms#getPublicRooms'
  post '/room/create', to: 'rooms#create'
  post '/room/joinPublic', to: 'rooms#joinPublicRoom'
  get '/room/participants/:room_id', to: 'rooms#getRoomParticipants'
  get '/room/getRoomById/:id', to: 'rooms#getRoomById'
  get '/room/userIsOwner/:room_id/:user_email', to: 'rooms#userIsOwner'
end
