class Api::V1::FavoritesController < Api::V1::BaseController
  def index
    @favorites = @current_user.favorites
  end

  def create
    @favorite = Favorite.new()
    @favorite.user = @current_user
    @favorite.art = Art.find(params[:id])
    if @favorite.save
      success_message
    else
      error_message(@favorite)
    end
  end

  def destroy
    @favorite = Favorite.find_by(art_id: params[:id], user_id: @current_user.id)
    p @favorite
    if @favorite.destroy
      success_message
    else
      error_message(@favorite)
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:art_id)
  end
  
end
