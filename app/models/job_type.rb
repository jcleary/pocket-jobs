class JobType < ApplicationRecord
  scope :standard, -> { where(custom: false) }
  scope :custom, -> { where(custom: true) }

  def name_with_points
    "#{name} (#{points.floor})"
  end
end