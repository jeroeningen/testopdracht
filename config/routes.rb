Testopdracht::Application.routes.draw do
  root :to => 'pages#index'

  resources :users
  match "/address", :to => "addresses#show", :as => "address"
  match "/user_destroy/:id", :to => "users#destroy", :as => "user_destroy" 

  match "/:controller(/:action(/:id))(.:format)"

end
