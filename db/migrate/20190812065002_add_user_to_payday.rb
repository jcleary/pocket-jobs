class AddUserToPayday < ActiveRecord::Migration[5.2]
  def change
    add_reference :paydays, :user, foreign_key: true
    add_reference :paydays, :bank_item, foreign_key: true
    add_column :paydays, :amount, :integer
    remove_column :paydays, :date, :date
  end
end
