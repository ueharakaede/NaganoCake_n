class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def surch
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def item_params
  params.require(:item).permit(:genre_id)
end
end
