class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :story
      t.text :description
      t.text :guide
      t.string :photo
      t.integer :publisher_id
      t.timestamps
    end
    add_foreign_key :games, :publishers
  end
end
