class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new
    initialize_hash
    @text_field = "text_field"

    html = render_to_string(layout: true, action: "new")

    kit = PDFKit.new(html, :page_size => 'Letter')
    kit.stylesheets << Rails.root.to_s + "/public/assets/application-49e46c8435a0747ac9d8178ca011c4113a16f77937fd101831faaad71baa7427.css"
    kit.to_file("#{Rails.root}/tmp/test.pdf")
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
