class PaymentsController < ApplicationController

  def new
    @unsub = Unsub.find(params[:unsub_id])
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

    #@order.update(payment: charge.to_json, state: 'paid')

    #redirect_to _path(@order)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to unsub_payment_path(@unsub)
  end

end
