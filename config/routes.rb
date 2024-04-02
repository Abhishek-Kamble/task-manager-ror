Rails.application.routes.draw do
  get "about", to:"about#index"
  # get "", to: "main#index"
  root to: "main#index"

  get "dashboard", to: "dashboard#index"

  get "profile", to: "profile#index"

  get "users_by_department", to: "users#users_by_department"
  
  get "login", to: "session#new"
  post "login", to: "session#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"
  
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  
  delete "logout", to: "session#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "/non_verified_tasks", to: "tasks#non_verified_tasks"
  get "/non_verified_tasks/:id", to: "tasks#show_for_approval", as: "show_for_approval"
  put "/non_verified_tasks/:id/approve", to: "tasks#approve", as: "approve_task"

  get "/assigned_tasks", to: "tasks#assigned_tasks"
  get "/assigned_tasks/:id", to: "tasks#show_assigned_task", as: "show_assigned_task"
  put "/assigned_tasks/:id/mark_done", to: "tasks#mark_complete", as: "mark_complete"
  put "/assigned_tasks/:id/acknowledge_task", to: "tasks#acknowledge_task", as: "acknowledge_task"
  resources :tasks
  
  resources :users
  # Error routes
  # match '/404', to: 'errors#not_found', via: :all
  # match '/500', to: 'errors#internal_server_error', via: :all
end