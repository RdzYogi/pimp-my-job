class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.job = @job
    @offer.user = current_user

    if @offer.save
      redirect_to job_path(@offer.job)
    else
      render job_path(@offer.job), status: :unprocessable_entity
    end
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update(offer_params)
      redirect_to job_path(@offer.job)
    else
      render job_path(@offer.job), status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    redirect_to job_path(@offer.job)
  end

  private

  def offer_params
    params.require(:offer).permit(:bid, :comment, :status)
  end
end
