class PaydaysController < ApplicationController
  def create
    user = User.find(params[:payday][:user_id])

    Payday.transaction do
      bank_item = BankItem.create(user: user, amount: user.next_payday_amount, description: "Banked #{user.jobs_completed.floor} points")
      payday = Payday.create(user: user, bank_item: bank_item)

      user.jobs.unpaid.update_all(payday_id: payday.id)
    end

    redirect_to user_bank_items_path(user)
  end
end
