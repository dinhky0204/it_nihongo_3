class HomePageController < ApplicationController
  def index
    @c_game = Game.all.count
    @c_review = Review.all.count
    @c_genre = Genre.all.count
    
    # if 1 < @c_review < 10 
    #   @last_reviews = Review.all
    # else
    #   @last_reviews = Review.last(10)
    # end
    @genres = Genre.all
    # @genre_review_tops = Genre.find(1).games
    #get point and review_id to hash @points
    @games = Game.all
    @reviews = Review.all
    if @c_review > 5
      @points = Hash.new
      @reviews.each do |review|
          @points[review.id] = ReviewComment.where(review_id: review.id).count
      end
      @points = @points.sort_by{|k,v| -v}
      @review_1st = Review.find(@points.first[0])
      @review_4ths = []
      (1..4).each  do |i|
        id = @points.at(i)[0]
        review = Review.find(id)
      @review_4ths << review
      end
      @points = @points.to_h
    end
    #get hot review by genre
    @c_check = 0
    if @c_review>=5 && @c_genre > 2
      @genre_points = Hash.new
      @genre_games = Genre.all.first.games
      @genre_games.each do |game|
        @genre_reviews = Review.where(game_id: game.id)
        @genre_reviews.each do |review|
          @genre_points[review.id] = ReviewComment.where(review_id: review.id).count
      end
      end
      @genre_points = @genre_points.sort_by{|k,v| -v}
      @genre_review_tops = []
      # @c_check = Review.where(review_id: review.id).count
      if @genre_points.length >=5
        @c_check = 1
        (0..4).each  do |i|
          id = @genre_points.at(i)[0]
          review = Review.find(id)
        @genre_review_tops << review
        end
      end
      @genre_points = @genre_points.to_h
    end
  end
  
  def genre_top
    @genre_points = Hash.new
    @genre_games = Genre.find(params[:genre]).games
    @genre_games.each do |game|
      @genre_reviews = Review.where(game_id: game.id)
      @genre_reviews.each do |review|
        @genre_points[review.id] = ReviewComment.where(review_id: review.id).count
    end
    end
    puts params[:genre]
    @genre_points = @genre_points.sort_by{|k,v| -v}
    @genre_review_tops = []
    (0..4).each  do |i|
      puts @genre_points.at(i)[0]
      review = Review.find(@genre_points.at(i)[0])
      game = Game.find(review.game_id)
      if game.photo == nil 
         review.photo = game.photo
      else
         review.photo = game.image
      end
      puts "aaa"
      puts game.image
      @genre_review_tops << review
    end
    @genre_points = @genre_points.to_h
    if request.xhr?
      respond_to do |format|
      format.json {
        render json: {genre_review_tops: @genre_review_tops}
      }
    end
    end
  end
end
