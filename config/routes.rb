Rails.application.routes.draw do
  resources :incoming_mails, only: [:create]
  root to: 'sites#home'
  get 'home', to: 'sites#home', as: 'sites_home'
  get 'contact', to: 'sites#contact', as: 'sites_contact'
  get 'services', to: 'sites#services', as: 'sites_services'
  get 'news', to: 'sites#news', as: 'sites_news'
  get 'staff_login', to: 'sites#staff_login', as: 'sites_staff_login'
  mount RailsAdmin::Engine => '/jafar', as: 'rails_admin'
  get '/index',to: 'pages#index', as: 'index'
  get 'pages/details'
  get '/print/:id/:format', to: 'pages#print', as: 'print'
  get '/print_money/:id/:format', to: 'pages#print_money', as: 'print_money'
  get '/print_edu/:id/:format', to: 'pages#print_edu', as: 'print_edu'
  get '/reprint_edu', to: 'pages#reprint_edu', as: 'reprint_edu'
  get '/flight', to: 'pages#flight', as: 'flight'
  get '/train', to: 'pages#train', as: 'train'
  get '/money', to: 'pages#money', as: 'money'
  get '/education', to: 'pages#education', as:'education'
  post '/entry_update', to: 'pages#entry_update', as: "entry_update"
  post '/edu_update', to: 'pages#edu_update', as: "edu_update"
  post '/money_update', to: 'pages#money_update', as: "money_update"
  get '/search_money', to: 'pages#search_money', as: 'search_money'
  get '/reprint_ticket', to: 'pages#reprint_ticket', as: 'reprint_ticket'
  get '/reprint_money', to: 'pages#reprint_money', as: 'reprint_money'
  get '/others', to: 'pages#other', as: "other"
  get '/reprint_other', to: 'pages#reprint_other' , as: 'reprint_other'
  get '/messages', to: 'pages#messages', as: 'messages'
  post '/message', to: 'sites#message_create', as: 'message_create'

  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
