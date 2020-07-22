ActiveAdmin.register Payday do
  menu priority: 4

  config.sort_order = 'created_at_desc'

  filter :user, collection: proc { User.children.ordered }
  filter :amount
  filter :created_at

  actions :index, :show

  index do
    column :user
    column :bank_item
    column :amount
    column :jobs do |payday|
      payday.jobs.count
    end
    column :created_at
    actions
  end
  show do
    attributes_table do
      row :user
      row :bank_item
      row :amount
      row :target_points
      row :created_at
      row :updated_at
    end
  end

  sidebar 'Jobs', only: :show do
    table_for payday.jobs do
      column :job_type
      column :created_at
    end
  end

end
