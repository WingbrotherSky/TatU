class Api::V1::ArtistsController < Api::V1::BaseController
  def show
    @artist = Artist.find(params[:id])
  end

  def index
    @artists = Artist.all
  end
end
