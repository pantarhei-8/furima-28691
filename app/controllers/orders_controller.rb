class OrdersController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render item_path
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :city, :house_number, :building_name, :phone_number, :shipping_origin_id, :customer_id)
  end
    
end