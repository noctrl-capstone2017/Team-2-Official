Rails.application.routes.draw do
  resources :teachers
  
  root 'application#hello'
  get '/index', to: 'static_pages#index'
end