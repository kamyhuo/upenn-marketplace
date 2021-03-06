Rails.application.routes.draw do
  resources :orders
  resources :charges
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  root 'welcome#index'

  resources :users do
    resources :shops
  end


 resources :shops do
    resources :listings do
      resources :images
      resources :orders
    end
  end

  resources :listings do
    resources :orders
  end

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  post '/shops/:shop_id/listings/:id', to: 'listings#state'
  patch '/shops/:shop_id/listings/:id', to: 'listings#state'
  post '/shops/:id/users', to: 'shops#add_user'
  delete '/shops/:id/users/:user_id', to: 'shops#delete_user'
  delete '/shops/:shop_id', to: 'shops#destroy'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
