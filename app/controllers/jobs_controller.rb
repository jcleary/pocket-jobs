class JobsController < ApplicationController
  def show
  end

  def create
    p params
    p job_params
    Job.create!(job_params)
    redirect_to action: :show
  end

  private

  def job_params
    params.require(:job).permit(:job_type_id, :user_id)
  end


  
 


end
