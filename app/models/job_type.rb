class JobType < ApplicationRecord
  def name_with_points
    "#{name} (#{points.floor})"
  end
end
