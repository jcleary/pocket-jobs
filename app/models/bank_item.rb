class BankItem < ApplicationRecord
  belongs_to :user
  has_one :payday, dependent: :destroy
end
