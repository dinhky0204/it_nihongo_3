class HomePageController < ApplicationController
  def index
    @last_reviews = Review.last(5)
    @genres = Genre.all
    @genre_review_tops = Genre.find(1).games
    #get point and review_id to hash @points
    # @points = Hash.new
    @games = Game.all
    # @games.each do |game|
    #   point = game.reviews.size
    #   # game.reviews.each do |review| 
    #   #   point += review.size()
    #   # end
    #   # game.like.each do |like| 
    #   #   point += 2*like.size
    #   # end
    #   @points[review.id] = point
    # end
    
    # @points = Hash[@points.sort]
    # sql = "Select title count() from genres inner joins games "
    # Select review.title from genres inner joins games inner joins reviews inner joins reviewcomments
    # sql = "Select * from ... your sql query here"
# records_array = ActiveRecord::Base.connection.execute(sql)
    # Review.joins(:games, :reviewcomments)
    
    
    @reviews = Review.all
    @points = Hash.new
    @reviews.each do |review|
      # if ReviewComment.where(review_id: id).count == 0
      #   @points[review.id ] = '-'
      # else
        @points[review.id] = ReviewComment.where(review_id: review.id).count
      # end
    end
    # @points = Hash[@points.sort_by(&:last)]
    @points = @points.sort_by{|k,v| -v}
    @review_1st = Review.find(@points.first[0])
    @review_4ths = []
    (1..3).each  do |i|
      id = @points.at(i)[0]
      review = Review.find(id)
    @review_4ths << review
    end

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
