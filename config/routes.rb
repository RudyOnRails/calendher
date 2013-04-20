Calendher::Application.routes.draw do
  resources :holidays


  devise_for :users

  root :to => "events#index"

  resources :events

  devise_for :users, :controllers => { :registrations => "registrations" }

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'home' => 'pages#home', :as => :home
end
