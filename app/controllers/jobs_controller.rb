class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @jobs = Job.all
    @markers = @jobs.geocoded.map do |job|
      {
        lat: job.latitude,
        lng: job.longitude
      }
    end
  end

  def show
    @offer = Offer.new
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, status: :see_other
  end

  def dashboard
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:name, :description, :deadline, :latitude, :longitude, :address, :price)
  end
end
