class CreateGameGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :game_genres do |t|
      t.integer :game_id
      t.integer :genre_id
      t.timestamps
    end
    add_foreign_key :game_genres, :games
    add_foreign_key :game_genres, :genres
  end
end
