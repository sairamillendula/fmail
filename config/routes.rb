Rails.application.routes.draw do
  root :to => "visitors#index"
  get '/compose' => 'users#compose'
  get '/message' => 'users#message'

  resources :users
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/facebook/setup', :to => 'facebook#setup'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
