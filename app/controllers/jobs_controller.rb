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

    if params[:custom] == 'recent'
      @custom_job_types = JobType.custom.order(last_used: :desc).limit(5)
    end
  end

  def create
    Job.create!(job_params)
    redirect_to url_after_create
  end

  private

  def url_after_create
    return jobs_path if request.referrer.blank?

    uri = URI(request.referrer)
    params = Rack::Utils.parse_nested_query(uri.query || '')
    params.delete('custom')
    uri.query = URI.encode_www_form(params)

    uri.to_s
  end

  def job_params
    params.require(:job).permit(:job_type_id, :user_id, job_type_attributes: [:name, :points, :custom])
  end
end
