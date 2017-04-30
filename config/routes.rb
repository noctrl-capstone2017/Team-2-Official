Rails.application.routes.draw do
  
  resources :teachers
  get '/index', to: 'static_pages#index'
  root 'static_pages#index'

end