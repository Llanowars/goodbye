class UnsubsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @unsub = Unsub.new
    @user = User.new
    initialize_hash
    @fields = generate_fields(@hash_service)


    # html = render_to_string(layout: true, action: "new")

    # kit = PDFKit.new(html, :page_size => 'Letter')
    # kit.stylesheets << Rails.root.to_s + "/public/" + view_context.asset_path("application.css")
    # kit.to_file("#{Rails.root}/tmp/test.pdf")


     # kit = PDFKit.new(html, :page_size => 'Letter')
    # kit.stylesheets << Rails.root.to_s + "/public/assets/application-49e46c8435a0747ac9d8178ca011c4113a16f77937fd101831faaad71baa7427.css"
     # kit.to_file("#{Rails.root}/tmp/test.pdf")

  end

  def create
    initialize_hash
    @fields = generate_fields(@hash_service)[7][:choices]

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
    @unsub = @user.unsubs.new(unsub_params)
    @unsub.form_complete = params[:unsub][:form_complete]
    @unsub.price = 7

    @unsub.service = @service

    @unsub.purpose = @unsub.form_complete["purpose"]
    @unsub.reason  = @unsub.form_complete["reason"]
    chosen_purpose = @fields.select { |f| f[:value] == @unsub.purpose }.first

    if chosen_purpose[:choices]
      chosen_reason = chosen_purpose[:choices].select { |choice| choice[:value] == @unsub.reason }.first
      @unsub.content = chosen_reason[:content]
    end

    if @unsub.save
      redirect_to unsub_path(@unsub)
    else
      render 'service/show'
    end

  end

  def show

    @unsub = Unsub.find(params[:id])

  end

  def send_email
    @unsub = Unsub.find(params[:unsub_id])
    @mail = Mail.new
    @mail.add_file("/tmp/file.pdf")
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
