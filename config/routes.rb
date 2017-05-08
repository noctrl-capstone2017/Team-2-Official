Rails.application.routes.draw do
  get 'login_session/new'
  get 'teachers/home'
  get  '/admin1', to: 'teachers#admin1'
  get  '/admin2', to: 'teachers#admin2'
  get  '/super1', to: 'teachers#super1'
  get  '/super2', to: 'teachers#super2'
  
  resources :roster_students
  resources :roster_squares
  resources :session_events
  resources :sessions
  resources :squares
  resources :students
  resources :teachers
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # route to home page
 
end
