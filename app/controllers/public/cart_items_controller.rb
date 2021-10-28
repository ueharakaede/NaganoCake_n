class Public::CartItemsController < ApplicationController
  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @item = Item.find(params[:id])
      @genres = Genre.all
      render "public/items/show"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item_params
  end

  def destroy_all
    @customer = current_customer
    @customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      if cart_item.item.id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attributes(amount: new_amount)
        @cart_item.delete
      end
    end
    if @cart_item.save
    redirect_to cart_items_path
  else
    @customer = current_customer
    @sum = 0
    render :index
  end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end

