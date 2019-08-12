class Payday < ApplicationRecord
  belongs_to :user
  belongs_to :bank_item
  has_many :jobs
end
