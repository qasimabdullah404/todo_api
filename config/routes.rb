Rails.application.routes.draw do
  root 'root#index'
  namespace :api do
    namespace :v1 do
      resources :todos
      post '/auth/signup', to: "users#create"
      post '/auth/login', to: "authentication#login"
    end
  end
end
