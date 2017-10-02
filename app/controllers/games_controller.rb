require 'csv'
class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    @game_genre = GameGenre.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
    @publishers = Publisher.all
    gon.genres = Genre.all
  end

  # GET /games/1/edit
  def edit
    @publishers = Publisher.all()
    gon.genres = Genre.all
  end

  # POST /games
  # POST /games.json
  def create
    list_genre_id = []
    list_genre = JSON.parse(params[:list_genre])
    puts "================>"
    # puts list_genre[0].class
    # puts list_genre[0]['tag']

    @game = Game.new(game_params)

    list_genre.each_with_index do |element, index|
      genre = Genre.find_by(name: list_genre[index]['tag'])
      list_genre_id.push(genre.id)
    end
    puts list_genre_id
    list_genre_id = list_genre_id.uniq
    respond_to do |format|
      if @game.save
        list_genre_id.each do |element|
          GameGenre.create(game_id: @game.id, genre_id: element)
        end
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
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

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    GameGenre.where(game_id: @game.id).destroy_all
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :story, :description, :guide, :publisher_id, :photo)
    end
    def genre_params
      params.require(:genre).permit(:list_genre)
    end
end
