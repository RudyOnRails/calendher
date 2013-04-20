Calendher::Application.routes.draw do
  devise_for :users

  root :to => "pages#home"
  resources :events

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
