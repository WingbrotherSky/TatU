class Api::V1::ShopsController < Api::V1::BaseController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end


  def search
    @shops = Artist.tagged_with(params[:query]).map{ |artist| artist.shop }
    render :index
  end
end
