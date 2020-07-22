ActiveAdmin.register Payday do
  menu priority: 4

  config.sort_order = 'created_at_desc'

  filter :user, collection: proc { User.children }
  filter :amount
  filter :created_at

  actions :index, :show, :new, :edit, :update, :create

  index do
    id_column
    column :user
    column :bank_item
    column :amount
    column :created_at
    actions
  end

end
