class UnsubsController < ApplicationController

  def new
    @unsub = Unsub.new
  end

  def create
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new(unsub_params)
    @unsub.service = @service
    if @unsub.save
      redirect_to service_path(@service)
    else
      render 'service/show'
    end
  end

  private

  def unsub_params
    params.require(:unsub).permit()
  end

end
