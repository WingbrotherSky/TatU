Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :artists, only: [:show]
      resources :shops, only: [:index]
      resources :arts,  only: [:show]
      resources :favorites, only: [:index, :create]
    end
  end
  post '/login', to: "login#login"
  put '/login', to: 'login#update'
end
