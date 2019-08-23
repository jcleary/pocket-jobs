class Payday < ApplicationRecord
  belongs_to :user
  belongs_to :bank_item, optional: true
  has_many :jobs
end
