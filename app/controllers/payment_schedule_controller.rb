class PaymentScheduleController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @job_types = JobType.all.order(:points)
  end
end
