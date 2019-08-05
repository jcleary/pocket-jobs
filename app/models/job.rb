class Job < ApplicationRecord
  belongs_to :user
  belongs_to :job_type
  belongs_to :payday, required: false

  scope :unpaid, -> { where(payday: nil) }
end
