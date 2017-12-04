Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get '/home', to: 'home#index'
  get '/login', to: 'users#login'
  get '/register', to: 'users#register'
  get '/validate', to: 'users#validate'
  
  resources :users, except: [:new]
  resources :owners

end
