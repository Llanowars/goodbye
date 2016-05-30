class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def create
    @unsub = Unsub.find(params[:unsub_id])
    @order = Order.create!(amount: @unsub.price_cents, state: 'pending')
    redirect_to new_order_payment_path(@order)
  end
end



