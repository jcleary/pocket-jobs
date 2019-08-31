class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  scope :children, -> { where(role: 'child') }

  has_many :jobs
  has_many :bank_items, -> { order(created_at: :desc) }
  has_many :paydays

  def percent_completed
    ((jobs_completed.to_f / next_payday.target_points) * 100).ceil
  end

  def jobs_completed
    jobs.unpaid.sum {|j| j.job_type.points }
  end

  def balance
    bank_items.sum(:amount)
  end

  def homepage_path
    case role
    when 'child'
      Rails.application.routes.url_helpers.user_jobs_path(self)
    when 'parent'
      Rails.application.routes.url_helpers.users_path
    when 'dashboard'
      Rails.application.routes.url_helpers.jobs_path
    end
  end

  def next_payday
    @next_payday ||= 
      paydays.where(bank_item_id: nil).first || 
      paydays.create(target_points: target_points)
  end

  def bank_points
    User.transaction do
      amount = next_payday_amount
      bank_item = bank_items.create(amount: amount, description: "Banked #{jobs_completed.floor} points")
      next_payday.update(bank_item: bank_item, amount: amount)

      jobs.unpaid.update_all(payday_id: next_payday.id)
      @next_payday = nil
    end
  end

  def next_payday_amount
    @jobs_completed = jobs_completed
    amount = [@jobs_completed, next_payday.target_points].min * pre_target_point_value
    if @jobs_completed >= next_payday.target_points
      amount += target_bonus  
      amount += (@jobs_completed - next_payday.target_points) * post_target_point_value
    end
    amount
  end
end
