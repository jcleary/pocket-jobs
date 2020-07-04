class AddCustomToJobType < ActiveRecord::Migration[5.2]
  def change
    add_column :job_types, :custom, :boolean
    add_column :job_types, :last_used, :datetime
  end
end
