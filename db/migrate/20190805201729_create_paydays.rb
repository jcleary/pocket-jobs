class CreatePaydays < ActiveRecord::Migration[5.2]
  def change
    create_table :paydays do |t|
      t.date :date

      t.timestamps
    end
  end
end
