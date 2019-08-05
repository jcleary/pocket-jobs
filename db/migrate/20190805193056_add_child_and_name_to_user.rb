class AddChildAndNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :child, :boolean
    add_column :users, :name, :string
  end
end
