Rails.application.routes.draw do
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
	  end
  end

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  post '/shops/:shop_id/listings/:id', to: 'listings#state'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
