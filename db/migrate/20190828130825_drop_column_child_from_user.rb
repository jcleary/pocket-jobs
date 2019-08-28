class DropColumnChildFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :child
  end
end
