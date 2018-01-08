Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get '/home', to: 'home#index'
  get '/tempat/:id/:nama_tempat', to: 'home#show', as: 'tempat_futsal'
  get '/browse-all', to: 'home#browse_all'
  get '/browse-all/s', to: 'home#cari', as: 'cari'


  #User && Session
  resources :users, only: [:create,:edit,:destroy,:update, :show]
  get '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  get '/register', to: 'users#register'
  post '/validate', to: 'sessions#create'

  #Admin
  get '/admin-dashboard', to: 'admin#index'
  get '/admins', to: 'admin#admins'
  get '/members', to: 'admin#members'
  get '/owners', to: 'admin#owners'
  get '/all-users', to: 'admin#all'

  #Lapang
  resources :lapangs, only: [:create,:destroy,:update]
  get '/lapang/:id_owner/:id', to: 'lapangs#show', as: 'show_lapang_as_member'
  get '/owner/manage/:id_owner/lapang/add', to: 'lapangs#new', as: 'add_lapang'
  get '/owner/manage/:id_owner/lapang/edit/:id', to: 'lapangs#edit', as: 'edit_lapang'
  get '/owner/manage/:id_owner/lapang/:id', to: 'lapangs#show', as: 'show_lapang'

  #Owners
  resources :owners, except: [:index,:show]
  get '/owner/dashboard', to: 'owners#index'
  get '/owner/manage/:id_owner', to: 'owners#show', as: 'manage_tempat'
  get '/owner/manage/:id_owner/order', to: 'owners#order', as: 'order_booking'
  get '/owner/manage/:id_owner/riwayat', to: 'owners#riwayat', as: 'riwayat'

  #Jadwal
  resources :jadwals, only: [:create, :destroy, :update]
  get '/jadwal/:id_lapang/:tgl/', to: 'jadwals#get_jadwal', as: 'getjadwal'
  put '/verifikasi/:id', to: 'jadwals#update', as: 'verif_order'

  #Notif
  resources :notif, only: [:create]
  get '/notif/:id', to: 'home#notif', as: 'notif'
 
end
 