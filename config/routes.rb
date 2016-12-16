Rails.application.routes.draw do
  get '/' => 'users#index'

  get '/events' => 'events#index'

  get '/users/:id/edit' => 'users#edit'

  get '/events/:id' => 'events#show'

  get '/events/:id/edit' => 'events#edit'

  post '/create' => 'users#create'

  post '/login' => 'sessions#create'

  post '/add' => 'events#create'

  post '/comment' => 'comments#create'

  post '/attends/:id' => 'attends#join'

  put '/users/:id' => 'users#update'

  put '/events/:id' => 'events#update'

  delete '/logout' => 'sessions#destroy'

  delete '/attends/:id' => 'attends#cancel'

  delete '/events/:id' => 'events#destroy'
end
