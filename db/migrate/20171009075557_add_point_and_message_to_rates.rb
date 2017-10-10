class AddPointAndMessageToRates < ActiveRecord::Migration[5.1]
  def change
    add_column :rate_tables, :point, :integer
    add_column :rate_tables, :message, :text
  end
end
