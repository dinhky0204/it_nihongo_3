class SearchController < ApplicationController
  def search
    search_text = params['text_search']
    if search_text != ''
      @list_game = Game.where(['name LIKE ?', "%#{search_text}%"]).limit(10)
      # @list_review = Review.where(['name LIKE ?', "%#{search_text}%"]).limit(10)
      respond_to do |format|
        format.json do
          render json: [{
                            list_game: @list_game
                            # list_review: @list_review
                        }].to_json

        end
      end
    end

  end
end