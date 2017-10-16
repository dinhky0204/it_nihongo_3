class AdminController < ApplicationController
  before_action :check_privileges!, only: [:index]
  def dashboard
    @count_genres = Genre.count
    @count_puplishers = Publisher.count
     @genres = Genre.order(created_at: :desc).all
  end
  
  def genres
    @genres = Genre.order(created_at: :desc).all
  end
  
  def genre_delete
    @genre = Genre.find(params[:genre_id])
    @genre.destroy
  end
  
  def genre_add
    @game = Genre.create(name: params[:genre_name])
    if request.xhr?
      respond_to do |format|
      format.json {
        render json: {game: @game}
      }
    end
    end
  end
  
  def genre_update
    Genre.update(params[:genre_id], :name => params[:genre_name])
  end
  
  def publishers
  end
  
  def check_privileges!
  redirect_to "/", notice: 'You dont have enough permissions to be here' unless current_user.is_admin
  end
end
