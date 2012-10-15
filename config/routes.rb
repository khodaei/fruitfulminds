Fruitfulminds::Application.routes.draw do
  root :to => "home#index"

  resource :users
  resource :sessions
  resource :presurvey
  resource :postsurvey
  # get 'home' => 'presurveys#show'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match "login" => "sessions#new", :as => "login"
  match "logout" => "sessions#destroy", :as => "logout"
  match "signup" => "users#new", :as => "signup"
  match "portal" => "home#portal", :as => "portal", :via => :get
end
