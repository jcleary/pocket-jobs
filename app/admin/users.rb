ActiveAdmin.register User do
  menu priority: 90

  permit_params %i[name email position target_points pre_target_points_value post_target_points_value role phone_number]

  config.filters = false

  index do
    column :name
    column :email
    column :postion
    column :role
    actions
  end

end
