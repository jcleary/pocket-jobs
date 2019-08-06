class JobType < ApplicationRecord
  def name_with_value
    "#{name} (#{value.floor})"
  end
end
