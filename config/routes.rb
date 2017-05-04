Rails.application.routes.draw do
  get 'login_session/new'
  get 'teachers/home'
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
  delete '/logout',  to: 'sessions#destroy'

  # route to home page
 

end
