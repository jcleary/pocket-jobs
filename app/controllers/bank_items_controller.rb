class BankItemsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @bank_items = @user.bank_items.page(params[:page]).per(7)
  end

  def new
    @user = User.find(params[:user_id])
    @bank_item = BankItem.new(user: @user)
    @direction = params[:direction]
  end

  def create
    @bank_item = BankItem.new(bank_item_params)
    @bank_item.amount = params[:bank_item][:amount].to_f.abs * params[:direction].to_i * 100
    @bank_item.save!

    redirect_to user_bank_items_path(params[:bank_item][:user_id])
  end

  private

  def bank_item_params
    params.require(:bank_item).permit(:user_id, :description)
  end
end
