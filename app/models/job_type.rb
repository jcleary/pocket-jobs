class JobType < ApplicationRecord
  scope :standard, -> { where(custom: false) }
  scope :custom, -> { where(custom: true) }

  validates :name, :points, presence: true
  validates :points, numericality: { less_than: 40, greater_than: 0 }

  def name_with_points
    "#{name} (#{points.floor})"
  end
end