class SubcategoriesController < ApplicationController
  def create
    j = JSON.parse(request.raw_post)
    @subcategory = Subcategory.new
    @subcategory[:name] = j['name']
    @subcategory.category = Category.find_or_initialize_by(id: j['category_id'])
    @subcategory.save

    render :json =>
    {
      "id" => @subcategory[:id],
      "name" => @subcategory[:name],
      "category_id" => @subactegory[:category_id]
    }, :status => 201
  end

  def index
    @subcategories = Subcategory.all.page(params[:page])
    if @subcategories.any?
         render :json => @subcategories
       else
         render :nothing => true, :status => 400
       end
  end

  def show
    @products = Product.where(subcategory_id: params[:id])


      if @products.persisted?
        render :json => @products
      else
        render :json => {}, :status => 400
      end
  end

  def update
    @subcategory = Subcategory.find_or_initialize_by(id: params[:id])

    if @subcategory.persisted?
        j = JSON.parse(request.raw_post)
        @subcategory[:name] = j['name']
        @subcategory.category = Category.find_or_initialize_by(id: j['category_id'])
        @subcategory.save
        render :json =>
        {
          "id" => @subcategory[:id],
          "name" => @subcategory[:name],
          "category_id" => @subactegory[:category_id]

        }, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @subcategory = Subcategory.find_or_initialize_by(id: params[:id])

    if @subcategory.persisted?
      render :json =>
        {
          "id" => @subcategory[:id],
          "name" => @subcategory[:name],
          "category_id" => @subactegory[:category_id]
        }, :status => 204

      else
        render :json => {}, :status => 404
      end
      @subcategory.destroy
  end

end
