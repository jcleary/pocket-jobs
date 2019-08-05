class AddCalcFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pre_target_point_value, :integer
    add_column :users, :target_bonus, :integer
    add_column :users, :post_target_point_value, :integer
  end
end
