class SubcategoriesController < ApplicationController
  def create
    j = JSON.parse(request.raw_post)
    @subcategory = Subcategory.new
    @subcategory[:name] = j['name']
    @subcategory.category = Category.find_or_initialize_by(id: j['categoryId'])
    @subcategory.save

    render :json =>
    {
      "id" => @subcategory[:id],
      "name" => @subcategory[:name]
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
end
