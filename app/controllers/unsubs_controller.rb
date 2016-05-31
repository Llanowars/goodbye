class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new
    initialize_hash
    @fields = generate_fields(@hash_service)

    html = render_to_string(layout: true, action: "new")

    # kit = PDFKit.new(html, :page_size => 'Letter')
    # kit.stylesheets << Rails.root.to_s + "/public/" + view_context.asset_path("application.css")
    # kit.to_file("#{Rails.root}/tmp/test.pdf")

  end

  def create
    @user = User.new
    @user.firstname = params[:unsub][:form_complete][:firstname]
    @user.lastname = params[:unsub][:form_complete][:lastname]
    @user.address = params[:unsub][:form_complete][:address]
    @user.address_complement = params[:unsub][:form_complete][:address_complement]
    @user.zipcode = params[:unsub][:form_complete][:zipcode]
    @user.city = params[:unsub][:form_complete][:city]
    @user.phone = params[:unsub][:form_complete][:phone]
    @user.email = params[:unsub][:form_complete][:email]
    @user.save

    @service = Service.find(params[:service_id])
    @unsub = Unsub.new(unsub_params)
    @unsub.form_complete = params[:unsub][:form_complete]

    @unsub.service = @service
    if @unsub.save
      redirect_to service_unsub_path(@service, @unsub)
    else
      render 'service/show'
    end
  end

  def show
    @unsub = Unsub.find(params[:id])
  end

  def generate_fields(hash)
    hash.each do |field|
      @fieldname = field[:name]
    end
  end

  private

  def initialize_hash
    file = File.read('app/assets/ugc.json')
    @hash_service = JSON.parse(file, symbolize_names: :true)[:fields]
  end



  def unsub_params
    params.require(:unsub).permit(:form_complete, :photo)
  end

end
