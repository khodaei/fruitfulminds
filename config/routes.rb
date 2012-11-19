Fruitfulminds::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:create, :destroy, :new]
  resources :reports
  resource :presurveys do
    resources :part1, :to => "presurveys/part1"
    resources :part2, :to => "presurveys/part2"
  end
  resources :postsurveys
  resources :foodjournals, :to => "food_journals"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match "login"  => "sessions#new", :as => "login"
  match "logout" => "sessions#destroy", :as => "logout"
  match "signup" => "users#new", :as => "signup"
  match "portal" => "home#portal", :as => "portal", :via => :get
  match "pending_users" => "users#pending_users", :as => "pending_users", :via => :get
  match "update_pending_users" => "users#update_pending_users", :as => "update_pending_users", :via => :post
  match "reports/generate_pdf" => "reports#generate_pdf", :via => :post

  root :to => redirect('/portal')

end
