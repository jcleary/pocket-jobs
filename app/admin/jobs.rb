ActiveAdmin.register Job do
  menu priority: 2

  config.sort_order = 'created_at_desc'

  filter :user, collection: proc { User.children.ordered }
  filter :created_at
  filter :description

  filter :job_type
  filter :created_at

  index do
    column :job_type
    column :payday
    column :created_at
    actions
  end

end