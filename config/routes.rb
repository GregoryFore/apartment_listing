Rails.application.routes.draw do
  get 'admin/index'

  get 'admin/update'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :apartments
  root 'apartments#index'
  get 'search_all' => 'apartments#search_all'

  get "admin" => "admin#index"
  put "admin/:id" => "admin#update"
  patch "admin/:id" => "admin#update"
  put "admin/:id/default" => "admin#update_default"
  patch "admin/:id/default" => "admin#update_default"
  put "admin/:id/admin" => "admin#update_admin"
  patch "admin/:id/admin" => "admin#update_admin"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
