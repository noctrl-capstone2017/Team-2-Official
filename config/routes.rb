Rails.application.routes.draw do
  root "login_session#new"
  
  get "teachers/:id/home",  to: 'teachers#home'
  get "sessions/session1"
  get "sessions/end"
  
  resources :roster_students
  resources :roster_squares
  resources :session_events
  resources :sessions
  resources :squares
  resources :students
  resources :teachers
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'login_session/new'
  # route to home page
 
end
