Fruitfulminds::Application.routes.draw do

  root :to => "home#portal"

  resource :users
  resource :sessions, :only => [:create, :destroy, :new]
  resource :reports
  resource :presurveys
  resource :postsurveys

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match "login" => "sessions#new", :as => "login"
  match "logout" => "sessions#destroy", :as => "logout"
  match "signup" => "users#new", :as => "signup"
  match "portal" => "home#portal", :as => "portal", :via => :get
end
