class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_datail = @order.order_datails
    @sum = 0
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "paid_up"
      @order.order_datails.each do |order_datail|
        order_datail.update(making_status:"waiting")
      end
    end
    redirect_to admin_order_path(@order.id)
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end


end
