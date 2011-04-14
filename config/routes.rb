Testopdracht::Application.routes.draw do
  root :to => 'pages#index'

  namespace :admin do
    root :to => "pages#index"
    resources :users
    match "/user_destroy/:id", :to => "users#destroy", :as => "user_destroy"
  end
  match "/address", :to => "addresses#show", :as => "address"

  match "/:controller(/:action(/:id))(.:format)"

end