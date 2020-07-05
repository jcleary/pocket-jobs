class Job < ApplicationRecord
  belongs_to :user
  belongs_to :job_type
  belongs_to :payday, required: false

  after_create :update_job_type

  scope :unpaid, -> { where(payday: nil) }

  accepts_nested_attributes_for :job_type

  private

  def update_job_type
    job_type.update(last_used: Time.now)
  end
end
