class AddDeletedAtToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :deleted_at, :datetime
  end
end
