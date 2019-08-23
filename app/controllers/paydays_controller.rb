class PaydaysController < ApplicationController
  def create
    Payday.transaction do
      user = User.find(params[:payday][:user_id])

      bank_item = BankItem.create(user: user, amount: user.next_payday_amount)
      payday = Payday.create(user: user, bank_item: bank_item)

      user.jobs.unpaid.update_all(payday_id: payday.id)
    end

    redirect_to user_bank_items_path(user)
  end
end
