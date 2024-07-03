class JobsController < ApplicationController

  def index
    filters = params[:filters].present? ? JSON.parse(params[:filters]) : {}
    @jobs = JobFilterService.call(params[:q], filters, Job.includes(:skills, :job_category).all).order(created_at: :asc)

    respond_to do |format|
      format.html # Render HTML by default
      format.js   # Render JavaScript response for AJAX requests
    end
  end

end
