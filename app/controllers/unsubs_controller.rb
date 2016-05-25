class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new
    initialize_hash
    @text_field = "text_field"

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

  def initialize_hash
    file = File.read('app/assets/jsonsample.json')
    @hash_service = JSON.parse(file, symbolize_names: :true)[:fields]
  end

  def generate_field

  end


  def field_type
    if @form_service[:type] == "text"
      @field_type = "text"
    end
  end

  def field_name
    @field_name = "name"
  end

  private

  def unsub_params
    params.require(:unsub).permit(:form_complete, :photo)
  end

end
