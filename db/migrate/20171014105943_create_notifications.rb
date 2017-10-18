class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :review_id
      t.integer :type
      t.string :text
      t.integer :status

      t.timestamps
    end
  end
end
