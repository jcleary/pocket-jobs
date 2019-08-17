class AddDescriptionToBankItem < ActiveRecord::Migration[5.2]
  def change
    add_column :bank_items, :description, :string
  end
end
