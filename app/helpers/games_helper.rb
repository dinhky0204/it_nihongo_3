module GamesHelper
    def photo_for(game, options = {size: 200})
      size = options[size]
      if game.photo?
        image_tag game.photo.url(:thumb), width: size, height: size
      else
        image_tag "game_default.jpg", width: size, height: size
      end
    end
end
