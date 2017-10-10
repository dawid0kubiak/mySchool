class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :role, :string, default: :new
    add_column :users, :phone, :string
  end
end
