Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/categories', to: 'categories#index'             #get all categories
  post '/categories', to: 'categories#create'           #create category
  put '/categories/:id', to: 'categories#update'        #edit category
  delete '/categories/:id', to: 'categories#destroy'    #delete category
  get '/categories/:id', to: 'categories#show'          #show one category


  get '/subcategories', to: 'subcategories#index'            #show subcategories
  post '/subcategories', to: 'subcategories#create'          #create subcategory
  get '/subcategories/:id', to: 'subcategories#show'         #show one subcategory
  put '/subcategories/:id', to: 'subcategories#update'       #edit subcategory
  delete '/subcategories/:id', to: 'subcategories#destroy'   #delete one subcategory


  get '/products', to: 'products#index'             #get all products
  post '/products', to: 'products#create'           #create product
  put '/products/:id', to: 'products#update'        #edit product
  delete '/products/:id', to: 'products#destroy'    #delete product
  get '/products/:id', to: 'products#show'          #show one product


  get '/brands', to: 'brands#index'             #get all brands
  post '/brands', to: 'brands#create'           #create brand
  put '/brands/:id', to: 'brands#update'        #edit brand
  delete '/brands/:id', to: 'brands#destroy'    #delete brand
  get '/brands/:id', to: 'brands#show'          #show one brand
  #get 'categories/:id/subcategories/:id/products', to: 'products#show'
  #post '/products', to: 'products#create'

end
