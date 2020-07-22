ActiveAdmin.register BankItem do
  menu priority: 3

  config.sort_order = 'created_at_desc'

  filter :user, collection: proc { User.children.ordered }
  filter :amount
  filter :created_at
  filter :description

  index do
    column :user
    column :amount
    column :description
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user
      row :amount do |bank_item|
        bank_item.amount / 100
      end
      row :description
      row :payday

      row :created_at
      row :updated_at
    end
  end

end
