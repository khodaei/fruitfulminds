Fruitfulminds::Application.routes.draw do
  root :to => "home#index"

  match "login" => "session#new", :as => "login"
  match "logout" => "session#destroy", :as => "logout"
  match "signup" => "users#new", :as => "signup"

  resource :users
  resource :sessions
end
