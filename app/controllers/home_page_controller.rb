class HomePageController < ApplicationController
  def index
    @genres = Genre.all
    @genre_review_tops = Genre.find(1).games
    @last_reviews = Review.last(5)
    
    @games = Game.all
    @points = Hash.new
    @games.each do |game|
      if RateHelper.point_avg(game.id) == 0
        @points[game.id ] = '-'
      else
        @points[game.id ] = RateHelper.point_avg(game.id)
      end
    end
    # max_quantity = @points.values.to_i.max
    # max_fruits = fruits.select { |k, v| v == max_quantity }.keys
    # @points.select {|x,i| i == @points.values.max }
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
