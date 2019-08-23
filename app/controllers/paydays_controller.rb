class PaydaysController < ApplicationController
  def create
    user = User.find(params[:payday][:user_id])
    user.bank_points

    redirect_to user_bank_items_path(user)
  end
end
