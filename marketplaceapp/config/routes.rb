Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/categories', to: 'categories#index'         #get all categories
  post '/categories', to: 'categories#create'       #create category
  put '/categories/:id', to: 'update#update'        #edit category
  delete '/categories/:id', to: 'destroy#destroy'   #delete category
  get '/categories/:id', to: 'categories#show'      #show one category


  get 'categories/:id/subcategories', to: 'categories#index'            #show subcategories
  post 'categories/:id/subcategories', to: 'categories#create'          #create subcategory
  get 'categories/:id/subcategories/:id', to: 'categories#show'         #show one subcategory
  put 'categories/:id/subcategories/:id', to: 'categories#update'       #edit subcategory
  delete 'categories/:id/subcategories/:id', to: 'categories#destroy'   #delete one subcategory


  #get 'categories/:id/subcategories/:id/products', to: 'products#show'
  #post '/products', to: 'products#create'

end
