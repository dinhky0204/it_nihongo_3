class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.integer :game_id, null: false
      t.text :content, null: false
      t.string :photo

      t.timestamps
    end
  end
end
