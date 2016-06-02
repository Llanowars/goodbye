class PaymentsController < ApplicationController

  def new
    @unsub = Unsub.find(params[:unsub_id])
  end

  def show
    @unsub = Unsub.find(params[:unsub_id])
  end

  def generate_pdf

    @unsub = Unsub.find(params[:unsub_id])
    @service = @unsub.service
    html = render_to_string(layout: false, action: "show")

    kit = PDFKit.new(html, :page_size => 'Letter')
    # kit.stylesheets << Rails.root.to_s + "/public" + view_context.asset_path("application.css")

    send_data(kit.to_pdf, :filename => "#{@unsub.form_complete['firstname'].capitalize}_#{@unsub.form_complete['lastname'].capitalize}_#{@unsub.service.name.gsub(" ", "_")}.pdf",
                          :type => "application/pdf")
  end

  def create
    @unsub = Unsub.find(params[:unsub_id])
    @amount = @unsub.price_cents

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email: params[:stripeEmail]
    )
    # You should store this customer id and re-use it.

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount:       @amount,  # in cents
      description:  "Payment for unsub #{} for order #{}",
      currency:     'eur'
    )


    UserMailer.unsub_email(@unsub).deliver_now

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to unsub_payment_path(@unsub)
  end

  def show
    @unsub = Unsub.find(params[:unsub_id])
  end

end
