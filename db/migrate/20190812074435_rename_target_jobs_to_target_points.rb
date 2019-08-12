class RenameTargetJobsToTargetPoints < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :target_jobs, :target_points
  end
end
