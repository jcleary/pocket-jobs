class AddPositionAndTargetJobsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :position, :integer
    add_column :users, :target_jobs, :integer
  end
end
