Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  root 'welcome#index'

  resources :users do
  	resources :shops do
	  resources :listings do
	  	resources :images
	  end
  end
end

 resources :shops do
	  resources :listings do
	  	resources :images
	  end
  end

  post '/users/:id/shops', to: 'users#add_shop'
  delete '/users/:id/shops/:shop_id', to: 'users#delete_shop'
  post '/shops/:id/users', to: 'shops#add_user'
  delete '/shops/:id/users/:user_id', to: 'shops#delete_user'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
