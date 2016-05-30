class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def create
    @unsub = Unsub.find(params[:unsub_id])
    @order = Order.create!(amount: @unsub.price, state: 'pending')
    redirect_to payments_new_path
  end
end



