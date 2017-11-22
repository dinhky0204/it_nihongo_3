require 'csv'
class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def top
  end
  # GET /games
  # GET /games.json
  def index
    @games = Game.last(4)
    @mores = Game.first(4)
    @game_genre = GameGenre.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
    @game.view = @game.view + 1
    @game.save
    @total = RateTable.where(game_id: params[:id]).count

    @star_1 = RateTable.where(game_id: params[:id], point: 1).count
    @star_2 = RateTable.where(game_id: params[:id], point: 2).count
    @star_3 = RateTable.where(game_id: params[:id], point: 3).count
    @star_4 = RateTable.where(game_id: params[:id], point: 4).count
    @star_5 = RateTable.where(game_id: params[:id], point: 5).count
    total_point = @star_1 + 2*@star_2 + 3*@star_3 + 4*@star_4 + 5*@star_5
    if @total==0
      @point_avg = 0
      gon.point1 = 0
      gon.point2 = 0
      gon.point3 = 0
      gon.point4 = 0
      gon.point5 = 0
    else
      @point_avg = (100*total_point/@total).round / 100.0
      gon.point1 = (100*@star_1/@total).to_s + "%"
      gon.point2 = (100*@star_2/@total).to_s + "%"
      gon.point3 = (100*@star_3/@total).to_s + "%"
      gon.point4 = (100*@star_4/@total).to_s + "%"
      gon.point5 = (100*@star_5/@total).to_s + "%"
    end
    @list_rate = RateTable.where(game_id: params[:id])
    if user_signed_in?
      @current_rate = RateTable.where(game_id: params[:id], user_id: current_user.id).first
    else
      @current_rate = nil
    end
    current_game = Game.find_by(id: params[:id])
    @list_review_of_game = current_game.reviews

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
    @game = Game.new(game_params)
    if params[:list_genre] == ''
      redirect_back fallback_location: { action: "games/new" }
    else
      list_genre = JSON.parse(params[:list_genre])


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
