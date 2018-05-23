class Api::V1::ArtsController < Api::V1::BaseController
  def show
    @art = Art.find(params[:id])
  end
end
