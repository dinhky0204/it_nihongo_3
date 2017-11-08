class AddDeletedAtToGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :deleted_at, :datetime
  end
end
