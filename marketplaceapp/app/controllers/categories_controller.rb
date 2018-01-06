class CategoriesController < ApplicationController
  def create
    j = JSON.parse(request.raw_post)
    @category = Category.new
    @category[:name] = j['name']
    @category.save
    render :json =>
    {
      "id" => @category[:id],
      "name" => @category[:name]

    }, :status => 201
  end

  def index
    @categories = Category.all.page(params[:page])
    if @categories.any?
				 render :json => @categories
			 else
				 render :nothing => true, :status => 400
			 end
  end

  def show
    @category = Category.find_or_initialize_by(id: params[:id])


      if @category.persisted?
        render :json =>
        {
          "id" => @category[:id],
          "name" => @category[:name]
        }
      else
        render :json => {}, :status => 400
      end
  end

  def update
    @category = Category.find_or_initialize_by(id: params[:id])

		if @category.persisted?
        j = JSON.parse(request.raw_post)
        @category[:name] = j['name']
        @category.save
        render :json =>
        {
          "id" => @category[:id],
          "name" => @category[:manufacturer]

        }, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @category = Category.find_or_initialize_by(id: params[:id])

    if @category.persisted?
      render :json =>
        {
          "id" => @category[:id],
          "name" => @category[:name]
        }, :status => 204

      else
        render :json => {}, :status => 404
      end
      @category.destroy
  end

end
