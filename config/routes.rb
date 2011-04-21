Testopdracht::Application.routes.draw do
  root :to => 'pages#index'
  resources :lightbox_sessions

  namespace :admin do
    root :to => "pages#index"
    resources :users, :fueltypes
  end
  match "/address", :to => "addresses#show", :as => "address"

  match "/:controller(/:action(/:id))(.:format)"

end