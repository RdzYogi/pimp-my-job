class OffersController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @offer = Offer.new
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def create
    @job = Job.find(params[:job_id])
    @offer = Offer.new(offer_params)
    @offer.job = @job
    @offer.user = current_user

    if @offer.save
      redirect_to "/jobs/#{@job.id}"
    else
      render "/jobs/#{@job.id}", status: :unprocessable_entity
    end
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update(offer_params)
      redirect_to "/jobs/#{@job.id}"
    else
      render "/jobs/#{@job.id}", status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    redirect_to "/jobs/#{@offer.job.id}"
  end

  private

  def offer_params
    params.require(:offer).permit(:bid, :comment, :status, :job_id)
  end
end
