class PaydaysController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource through: :user

  def create
    @user.bank_points

    redirect_to user_bank_items_path(@user)
  end
end
