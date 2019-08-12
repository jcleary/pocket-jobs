class RenameValueToPoints < ActiveRecord::Migration[5.2]
  def change
    rename_column :job_types, :value, :points
  end
end
