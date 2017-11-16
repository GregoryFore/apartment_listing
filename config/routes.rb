Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :apartments
  root 'apartments#index'
  get 'search_all' => 'apartments#search_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
