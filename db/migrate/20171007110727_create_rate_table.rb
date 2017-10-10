class CreateRateTable < ActiveRecord::Migration[5.1]
  def change
    create_table :rate_tables do |t|
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end
    add_foreign_key :rate_tables, :users
    add_foreign_key :rate_tables, :games
  end
end
