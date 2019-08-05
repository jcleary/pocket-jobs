class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :user
      t.references :job_type
      t.references :payday

      t.timestamps
    end
  end
end
