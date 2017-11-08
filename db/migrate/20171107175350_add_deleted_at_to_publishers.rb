class AddDeletedAtToPublishers < ActiveRecord::Migration[5.1]
  def change
    add_column :publishers, :deleted_at, :datetime
  end
end
