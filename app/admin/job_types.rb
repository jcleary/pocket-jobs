ActiveAdmin.register JobType do
  menu priority: 5

  config.filters = false

  scope :all, default: true
  scope :standard
  scope :custom

  permit_params [:name, :points, :custom]

  show do
    attributes_table do
      row :name
      row :points
      row :custom
      row :last_used
    end
  end

  index do
    column :name
    column :points
    column :custom
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs :name, :points, :custom
    f.actions

  end
end
