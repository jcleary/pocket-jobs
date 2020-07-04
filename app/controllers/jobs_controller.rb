class JobsController < ApplicationController
  load_and_authorize_resource :user

  def index
    if @user.present?
      @child = User.children.find(params[:user_id])
    else
      @children = User.children.ordered
    end
    @job_type = JobType.new
    @job = Job.new(job_type: @job_type)
  end

  def create
    Job.create!(job_params)
    redirect_back(fallback_location: jobs_path, custom: false)
  end

  private

  def job_params
    params.require(:job).permit(:job_type_id, :user_id, job_type_attributes: [:name, :points, :custom])
  end
end
