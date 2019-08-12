class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :children, -> { where(child: true) }

  has_many :jobs
  has_many :bank_items

  def percent_completed
    ((jobs_completed.to_f / target_jobs) * 100).ceil
  end

  def jobs_completed
    jobs.unpaid.sum {|j| j.job_type.value }
  end

  def balance
    bank_items.sum(:amount)
  end

  def next_payday_amount
    @jobs_completed = jobs_completed
    value = [@jobs_completed, target_jobs].min * pre_target_point_value
    if @jobs_completed >= target_jobs
      value += target_bonus  
      value += (@jobs_completed - target_jobs) * post_target_point_value
    end
    value
  end
end
