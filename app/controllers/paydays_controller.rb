class PaydaysController < ApplicationController
  def create
    payday = Payday.find_or_create_by(date: Date.today)
    p payday

    # where might be a better home for this?
    user_id = params[:payday][:user_id]
    User.find(user_id).jobs.unpaid.update_all(payday_id: payday.id)
    redirect_to jobs_path
  end

  private

  def payday_params
    params.require(:payday).permit(:user_id)
  end
end
