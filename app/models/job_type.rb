class JobType < ApplicationRecord
  has_many :jobs

  scope :standard, -> { where(custom: false) }
  scope :custom, -> { where(custom: true) }

  before_save :upgrade_to_standard_job

  validates :name, :points, presence: true
  validates :points, numericality: { less_than_or_equal_to: 40, greater_than_or_equal_to: 1 }

  def name_with_points
    "#{name} (#{points.floor})"
  end

  private

  def upgrade_to_standard_job
    if custom? && jobs.count > 5
      self.custom = false
    end
  end
end