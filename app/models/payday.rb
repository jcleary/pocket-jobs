class Payday < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :user
  belongs_to :bank_item, optional: true
  has_many :jobs

  before_destroy :unlink_jobs

  def send_summary
    message =
      "It's payday #{user.name}! You have just been paid #{number_to_currency(amount.to_f / 100)}. " +
      "Your balance is now #{number_to_currency(user.balance.to_f / 100)}"

    user.send_sms(message)
  end

  private

  def unlink_jobs
    jobs.update_all(payday_id: nil)
  end
end
