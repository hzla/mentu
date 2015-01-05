Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  root to: 'pages#home'
  resources :users

  ['help', 'contact', 'faq', 'about', 'terms'].each do |page|
    get "/#{page}", to: ("pages#" + "#{page}"), as: page 
  end


  get '/auth/facebook/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', :to => 'sessions#destroy'
end