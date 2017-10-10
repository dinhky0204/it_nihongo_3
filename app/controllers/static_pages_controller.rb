class StaticPagesController < ApplicationController
  def home
    @genres = Genre.all
    @game_tops = Genre.find(1).games
  end

  def help
  end
  
  def genre_top
    @games = []
    if params[:genre].present?
    @games = Genre.find(params[:genre]).games
    end
    if request.xhr?
      respond_to do |format|
      format.json {
        render json: {games: @games}
      }
    end
    end
  end
end
