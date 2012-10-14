Fruitfulminds::Application.routes.draw do
<<<<<<< HEAD
  root :to => "home#index"
=======

  resource :presurvey
  resource :postsurvey
  get 'home' => 'presurveys#show'

  # The priority is based upon order of creation:
  # first created -> highest priority.
>>>>>>> 7a656cebc0e4198b54989ccafb2cebb7ea75fe80

  match "login" => "session#new", :as => "login"
  match "logout" => "session#destroy", :as => "logout"
  match "signup" => "users#new", :as => "signup"

  resource :users
  resource :sessions
end
