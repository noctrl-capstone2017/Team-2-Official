Rails.application.routes.draw do
  get 'login_session/new'
  get 'teachers/home'
  get 'schools/index'
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
