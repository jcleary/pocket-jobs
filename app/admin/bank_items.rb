ActiveAdmin.register BankItem do
  menu priority: 3

  filter :user
  filter :amount
  filter :created_at
  filter :description


end
