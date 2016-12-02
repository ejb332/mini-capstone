Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/products" => "products#index"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"
  get "/suppliers/new" => "suppliers#new"
  post "/suppliers" => "suppliers#create"
  get "/suppliers/:id" => "suppliers#show"
  get "/suppliers/:id/edit" => "suppliers#edit"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  get "/cart" => "carted_products#index"
  post "/cart" => "carted_products#create"
end