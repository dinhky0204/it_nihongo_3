class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :story
      t.text :description
      t.text :guide
<<<<<<< HEAD
      t.string :photo
      t.integer :publisher_id
=======
      t.integer :publisher_id
      t.string :photo
>>>>>>> e0e981a45ecc5acfa8a7a97dca4456e173336753

      t.timestamps
    end
    add_foreign_key :games, :publishers
  end
end
