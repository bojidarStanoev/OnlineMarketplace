class PromotionsController < ApplicationController
  def create
    j = JSON.parse(request.raw_post)
    @promotion = Promotion.new
    @promotion[:name] = j['name']
    @promotion[:newprice] = j['newprice']
    @promotion.product = Product.find_or_initialize_by(id: j['product_id'])
    @promotion.save
    render :json =>@promotion, :status => 201
  end
  def index
    @promotions = Promotion.all.page(params[:page])
    if @promotions.any?
         render :json => @promotions
       else
         render :nothing => true, :status => 400
       end
  end
  def show
    @promotion = Promotion.find_or_initialize_by(id: params[:id])


      if @promotion.persisted?
        render :json => @promotion
      else
        render :json => {}, :status => 400
      end
  end

  def update
    @promotion = Promotion.find_or_initialize_by(id: params[:id])

    if @promotion.persisted?
        j = JSON.parse(request.raw_post)
        @promotion[:name] = j['name']
        @promotion[:newprice] = j['newprice']
        @promotion.product = Product.find_or_initialize_by(id: j['product_id'])
        @promotion.save

        render :json => @promotion, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @promotion = Promotion.find_or_initialize_by(id: params[:id])

    if @promotion.persisted?
      render :json => @promotion, :status => 204

      else
        render :json => {}, :status => 404
      end
      @promotion.destroy
  end
end
