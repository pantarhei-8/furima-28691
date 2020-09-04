class ItemsController < ApplicationController
  def index
    @items = Item.all
    # @customer = Customer.select("user_id")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :status_id, :shipping_charger_id, :shipping_origin_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end
  
end
