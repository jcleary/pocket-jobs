class JobsController < ApplicationController
  def index
  end

  def create
    Job.create!(job_params)
    redirect_to action: :index
  end

  private

  def job_params
    params.require(:job).permit(:job_type_id, :user_id)
  end


  
 


end
