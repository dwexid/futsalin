Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get '/home', to: 'home#index'
  get '/login', to: 'sessions#login'
  get '/register', to: 'users#register'
  post 'users/validate', to: 'sessions#create'
  
  resources :users, except: [:new]
  resources :owners

end
