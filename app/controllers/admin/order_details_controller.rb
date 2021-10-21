class Admin::OrderDetailsController < ApplicationController
  def update
  @order_datail = OrderDetail.find(params[:id])
  @order_datail.update(order_datail_params)
    if @order_datail.making_status == "making"
      @order_datail.order.update(status: "production")
    elsif
      order_datails = @order_datail.order.order_datails
      boolean = true
      order_datails.each do |order_datail|
    if order_datail.making_status != "complete"
        boolean = false
      end
    end
    
    if boolean
      @order_datail.order.update(status: "preparing")
    end
  end
  redirect_to admin_order_path(@order_datail.order.id)
  end

private

  def order_datail_params
    params.require(:order_datail).permit(:making_status)
  end
      
end
