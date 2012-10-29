Fruitfulminds::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:create, :destroy, :new]
  resources :reports
  resource :presurveys do
    resources :part1, :to => "presurveys"
    resources :part2, :to => "presurveys"
  end
  resources :postsurveys
  resources :foodjournals, :to => "food_journals"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match "login"  => "sessions#new", :as => "login"
  match "logout" => "sessions#destroy", :as => "logout"
  match "signup" => "users#new", :as => "signup"
  match "portal" => "home#portal", :as => "portal", :via => :get

  root :to => redirect('/portal')

end
