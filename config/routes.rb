Calendher::Application.routes.draw do
  root :to => "home#index"
  resources :events

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
