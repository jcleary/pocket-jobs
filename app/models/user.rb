class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :children, -> { where(child: true) }

  has_many :jobs

  def percent_completed
    ((jobs_completed.to_f / target_jobs) * 100).ceil
  end

  def jobs_completed
    jobs.unpaid.count
  end
end
