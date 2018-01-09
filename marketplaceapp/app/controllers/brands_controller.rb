class BrandsController < ApplicationController
  def create
    j = JSON.parse(request.raw_post)
    @brand = Brand.new
    @brand[:name] = j['name']
    @brand.save
    render :json =>
    {
      "id" => @brand[:id],
      "name" => @brand[:name]

    }, :status => 201
  end

  def index
    @brands = Brand.all.page(params[:page])
    if @brands.any?
         render :json => @brands
       else
         render :nothing => true, :status => 400
       end
  end

  def show
    @products = Product.where(brand_id: params[:id])

      if @products.persisted?
        render :json =>@products
      else
        render :json => {}, :status => 400
      end
  end

  def update
    @brand = Brand.find_or_initialize_by(id: params[:id])

    if @brand.persisted?
        j = JSON.parse(request.raw_post)
        @brand[:name] = j['name']
        @brand.save
        render :json =>
        {
          "id" => @brand[:id],
          "name" => @brand[:name]

        }, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @brand = Brand.find_or_initialize_by(id: params[:id])

    if @brand.persisted?
      render :json =>
        {
          "id" => @brand[:id],
          "name" => @brand[:name]
        }, :status => 204

      else
        render :json => {}, :status => 404
      end
      @brand.destroy
  end


end
