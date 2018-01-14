class ProductsController < ApplicationController
  def create
    j = JSON.parse(request.raw_post)
    @product = Product.new
    @product[:name] = j['name']
    @product[:description] = j['description']
    @product[:image] = j['image']
    @product[:price] = j['price']
    @product.brand = Brand.find_or_initialize_by(id: j['brand_id'])
    @product.subcategory = Subcategory.find_or_initialize_by(id: j['subcategory_id'])
    @product.save
    render :json =>@product, :status => 201
  end

  def index
    @products = Product.all.page(params[:page])
    if @products.any?
         render :json => @products
       else
         render :nothing => true, :status => 400
       end
  end

  def show
    @product = Product.find_or_initialize_by(id: params[:id])


      if @product.persisted?
        render :json => @product
      else
        render :json => {}, :status => 400
      end
  end

  def update
    @product = Product.find_or_initialize_by(id: params[:id])

		if @product.persisted?
        j = JSON.parse(request.raw_post)
        @product[:name] = j['name']
        @product[:description] = j['description']
        @product[:image] = j['image']
        @product[:price] = j['price']
        @product.brand = Brand.find_or_initialize_by(id: j['brand_id'])
        @product.subcategory = Subcategory.find_or_initialize_by(id: j['subcategory_id'])
        @product.save

        render :json => @product, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @product = Product.find_or_initialize_by(id: params[:id])

    if @product.persisted?
      render :json => @product, :status => 204

      else
        render :json => {}, :status => 404
      end
      @product.destroy
  end
end
