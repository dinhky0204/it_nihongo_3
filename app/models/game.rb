class Game < ApplicationRecord
	belongs_to :publisher
  mount_uploader :photo, GameUploader
  has_many :game_genres
  has_many :genres, through: :game_genres
  has_many :reviews
end
