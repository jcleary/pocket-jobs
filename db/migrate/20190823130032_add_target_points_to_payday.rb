class AddTargetPointsToPayday < ActiveRecord::Migration[5.2]
  def change
    add_column :paydays, :target_points, :integer
  end
end
