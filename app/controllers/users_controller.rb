class UsersController < ApplicationController
  load_and_authorize_resource :user

  def index
    @children = @users.children.order(:position)
  end

  def show
    @money_data = Hash.new(0)
    bank_items = @user.bank_items.where('created_at >= ?', 30.days.ago)
    bank_items.each do |item|
      @money_data[item.created_at.to_date] += item.amount.to_f / 100
    end

    @prev = @user.bank_items.where('created_at < ?', 30.days.ago).sum(:amount).to_f / 100
    29.downto(0).each do |d| 
      p @prev
      date = d.days.ago.to_date
      @money_data[date] += @prev
      @prev = @money_data[date] 
    end

    @money_data = @money_data.sort.to_h
    p @money_data.to_a

  end
end
