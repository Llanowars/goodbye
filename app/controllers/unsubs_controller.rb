class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new
    initialize_form
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

  def initialize_form
    file = File.read('app/assets/jsonsample.json')
    @form_service = JSON.parse(file, symbolize_names: :true)[:fields]
  end

  def generate_form

  end

  private

  def unsub_params
    params.require(:unsub).permit()
  end

end
