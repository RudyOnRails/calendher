Calendher::Application.routes.draw do
  root :to => "events#index"
  resources :events

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
