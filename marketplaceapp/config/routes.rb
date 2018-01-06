Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/categories', to: 'categories#index'         #get all categories
  post '/categories', to: 'categories#create'       #create category
  put '/categories/:id', to: 'categories#update'        #edit category
  delete '/categories/:id', to: 'categories#destroy'   #delete category
  get '/categories/:id', to: 'categories#show'      #show one category


  get '/subcategories', to: 'subcategories#index'            #show subcategories
  post '/subcategories', to: 'subcategories#create'          #create subcategory
  get '/subcategories/:id', to: 'subcategories#show'         #show one subcategory
  put '/subcategories/:id', to: 'subcategories#update'       #edit subcategory
  delete '/subcategories/:id', to: 'subcategories#destroy'   #delete one subcategory


  #get 'categories/:id/subcategories/:id/products', to: 'products#show'
  #post '/products', to: 'products#create'

end
