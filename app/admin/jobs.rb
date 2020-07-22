ActiveAdmin.register Job do
  menu priority: 2

  config.sort_order = 'created_at_desc'

  filter :user, collection: proc { User.children }

  filter :job_type
  filter :created_at

  index do
    id_column
    column :job_type
    column :payday
    column :created_at
    actions
  end

end
