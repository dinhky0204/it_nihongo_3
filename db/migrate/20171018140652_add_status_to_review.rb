class AddStatusToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :status, :boolean
  end
end
