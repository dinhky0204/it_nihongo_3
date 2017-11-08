class AdminController < ApplicationController
  before_action :check_privileges!, only: [:index]
  def dashboard
    @count_genres = Genre.where(deleted_at: nil).count
    @count_puplishers = Publisher.count
    @count_games = Game.count
    @count_reviews = Review.count
     @genres = Genre.order(created_at: :desc).all
  end
  
  def genres
    @genres = Genre.where(deleted_at: nil).order(created_at: :desc).all
  end
  
  def genre_delete
    @genre = Genre.find(params[:genre_id])
    @genre.deleted_at = Time.now
    @genre.save
    # @genre.destroy
  end
  
  def genre_add
    @genre = Genre.create(name: params[:genre_name])
    if request.xhr?
      respond_to do |format|
      format.json {
        render json: {genre: @genre}
      }
    end
    end
  end
  
  def genre_update
    Genre.update(params[:genre_id], :name => params[:genre_name])
  end
  
  def publishers
    @publishers = Publisher.where(deleted_at: nil).order(created_at: :desc).all
  end
  
  def publisher_delete
    @publisher = Publisher.find(params[:publisher_id])
    @publisher.deleted_at = Time.now
    @publisher.save
  end
  
  def publisher_add
    @publisher = Publisher.create(name: params[:publisher_name])
    if request.xhr?
      respond_to do |format|
      format.json {
        render json: {publisher: @publisher}
      }
    end
    end
  end
  
  def publisher_update
    Publisher.update(params[:publisher_id], :name => params[:publisher_name])
  end
  
  def games
    @games = Game.where(deleted_at: nil).order(created_at: :desc).all
  end
  
  def game_delete
    @game = Game.find(params[:game_id])
    @game.deleted_at = Time.now
    @genre.save
    # @genre.destroy
  end
  
  def create_game
    @genres = Genre.where(deleted_at: nil).order(created_at: :desc).all
    @publishers = Publisher.all
    @game = Game.new
    gon.genres = Genre.all
  end
  
  def edit_game
    @publishers = Publisher.all()
    gon.genres = Genre.all
    puts params[:game]
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def check_privileges!
  redirect_to "/", notice: 'You dont have enough permissions to be here' unless current_user.is_admin
  end
  
  private
    def game_params
      params.require(:game).permit(:name, :story, :description, :guide, :publisher_id, :photo)
    end
end
