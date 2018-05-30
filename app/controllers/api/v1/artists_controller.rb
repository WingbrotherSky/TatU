class Api::V1::ArtistsController < Api::V1::BaseController
  def show
    @artist = Artist.find(params[:id])
  end

  def index
    @artists = Artist.all
  end

  def search
    @artists = Artist.tagged_with(params[:query], wild: true, any: true)
    p @artists
    render :index
  end
end
