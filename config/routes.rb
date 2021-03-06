Rails.application.routes.draw do
  root "login_session#new"
  
  get "teachers/:id/home",  to: 'teachers#home'
  get "sessions/end"
  get 'teachers/:id/pword' => 'teachers#pword'
  
  resources :roster_students
  resources :roster_squares
  resources :session_events
  resources :sessions
  resources :squares
  resources :students
  resources :teachers
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/index', to: 'static_pages#index'
  root 'static_pages#index'
  
  # LOGIN / LOGOUT
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  
  get '/logout', to: 'static_pages#logout1'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/logout2', to: 'static_pages#logout2'

  # route to home page
  
end
