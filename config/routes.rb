Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  post '/activate', to: "users#activate", as: "activate" 

  ['help', 'contact', 'faq', 'about', 'terms', 'opentok'].each do |page|
    get "/#{page}", to: ("pages#" + "#{page}"), as: page 
  end

  resources :amas
  resources :comments
  get '/comments/:id/upvote', to: 'comments#upvote', as: 'comment_upvote'


  mount RailsWebConsole::Engine => '/inspect1119yacademY'

  resources :sessions, only: [:create]
  get '/auth/facebook/callback', :to => 'sessions#facebook_create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', :to => 'sessions#destroy', as: "logout"
  mount Upmin::Engine => '/admin'

end