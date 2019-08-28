class PaymentScheduleController < ApplicationController
  load_and_authorize_resource :user

  def show
    @job_types = JobType.all.order(:points)
  end
end
