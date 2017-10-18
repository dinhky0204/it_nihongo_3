class AddAddressGenderBirthdayToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    add_column :users, :gender, :integer
    add_column :users, :birthday, :date
  end
end
