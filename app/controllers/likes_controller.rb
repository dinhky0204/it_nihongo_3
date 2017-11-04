class LikesController < ApplicationController
  include LikesHelper
  before_action :set_like, only: %i[show edit update destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show;
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit;
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(like_params)
    @review_id = like_params[:review_id]
    @like.user_id = current_user.id
    @find_like = Like.where(user_id: current_user.id, review_id: @review_id).first
    if !@find_like
      @like.save
      @like_count = @like.review.likes.count
      render json: {
          like_count: @like_count,
          like: @like
      }
    else
      @like_count = @like.review.likes.count
      render json: {
          like_count: @like_count,
          like: @find_like
      }
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html {redirect_to @like, notice: 'Like was successfully updated.'}
        format.json {render :show, status: :ok, location: @like}
      else
        format.html {render :edit}
        format.json {render json: @like.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    if !@like
      puts "khong xoa"
      @like_count = @like.review.likes.count
      render json: @like_count
    else
      puts "xoa"
      @like.destroy
      @like_count = @like.review.likes.count
      render json: @like_count
    end
  end

  def check_delete
    @find_like = Like.find_by(id: params[:like_id])
    if !@find_like
      puts "khong xoa"
      @like_count = Review.find(params[:review_id]).likes.count
      render json: @like_count
    else
      puts "xoa"
      @find_like.destroy
      @like_count = Review.find(params[:review_id]).likes.count
      render json: @like_count
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def like_params
    params.require(:like).permit(:user_id, :review_id)
  end
end
