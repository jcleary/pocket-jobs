class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.reference :user
      t.reference :job_tyoe
      t.reference :payday

      t.timestamps
    end
  end
end
