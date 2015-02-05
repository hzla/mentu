Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users

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
  get '/logout', :to => 'sessions#destroy'


  get '/admin', to: 'admins#index'
  get '/admin/users/:id', to: "admins#show", as: 'admin_user'

end