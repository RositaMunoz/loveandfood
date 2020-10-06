Rails.application.routes.draw do
  get 'filtros/index'
  get 'filtros/new'
  get 'filtros/create'
  get 'filtros/destroy'
  get 'greetings/hello', to: 'greetings#hello'

  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  # devise_for :users, :path_prefix => 'my'

  root to: 'greetings#hello'

  # CREATE
  get 'comunas/new', to: 'comunas#new'
  post 'comunas', to: 'comunas#create'

  get 'comentarios/new', to: 'comentarios#new'
  post 'comentarios', to: 'comentarios#create'

  get 'gustos/new', to: 'gustos#new'
  post 'gustos', to: 'gustos#create'

  get 'establecimientos/new', to: 'establecimientos#new'
  post 'establecimientos', to: 'establecimientos#create'

  get 'appointments/new', to: 'appointments#new'
  post 'appointments', to: 'appointments#create'

  post 'matches', to: 'matches#create'

  post 'matches', to: 'matches#new'

  # READ
  get 'comunas', to: 'comunas#index', as: 'list_comunas'
  get 'comunas/:id', to: 'comunas#show', as: 'comuna'

  get 'comentarios', to: 'comentarios#index', as: 'list_comentarios'
  get 'comentarios/:id', to: 'comentarios#show', as: 'comentario'

  get 'gustos', to: 'gustos#index', as: 'list_gustos'
  get 'gustos/:id', to: 'gustos#show', as: 'gusto'

  get 'establecimientos', to: 'establecimientos#index', as: 'list_establecimientos'
  get 'establecimientos/:id', to: 'establecimientos#show', as: 'establecimiento'

  get 'appointments', to: 'appointments#index', as: 'list_appointments'
  get 'appointments/:id', to: 'appointments#show', as: 'appointment'

  get 'matches/:matcher_id', to: 'matches#index', as: 'list_matches'
  get 'filtros/:id', to: 'filtros#show', as: 'filtro'

  # UPDATE
  get 'comunas/:id/edit', to: 'comunas#edit', as: 'comunas_edit'
  patch 'comunas/:id', to: 'comunas#update'

  get 'comentarios/:id/edit', to: 'comentarios#edit', as: 'comentarios_edit'
  patch 'comentarios/:id', to: 'comentarios#update'

  get 'gustos/:id/edit', to: 'gustos#edit', as: 'gustos_edit'
  patch 'gustos/:id', to: 'gustos#update'

  get 'establecimientos/:id/edit', to: 'establecimientos#edit', as: 'establecimientos_edit'
  patch 'establecimientos/:id', to: 'establecimientos#update'

  get 'appointments/:id/edit', to: 'appointments#edit', as: 'appointments_edit'
  patch 'appointments/', to: 'appointments#update'

  get 'filtros/:id/edit', to: 'filtros#edit', as: 'filtro_edit'
  patch 'filtros/:id', to: 'filtros#update'

  # DELETE
  delete 'comunas/:id', to: 'comunas#destroy'
  delete 'comentarios/:id', to: 'comentarios#destroy'
  delete 'gustos/:id', to: 'gustos#destroy'
  delete 'establecimientos/:id', to: 'establecimientos#destroy'
  delete 'matches/:id', to: 'matches#destroy'
  delete 'appointments/:id', to: 'appointments#destroy'

  # USER
  get 'users', to: 'users#index', as: 'list_users'
  get 'users/profile/:id', to: 'users#show', as: 'especific_user'
  get 'users/profile/:id/edit', to: 'users#edit', as: 'user'

# para eliminar otros usuarios
match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  # devise_for :users, :path_prefix => 'd'
end
