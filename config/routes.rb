#Rails.application.routes.draw do
#  get '/index', to: 'static_pages#index'
#end


Rails.application.routes.draw do
  root 'application#hello'
end