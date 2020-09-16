class OrdersController < ApplicationController
  before_action :set_item
  before_action :signed_in_user, only: [:index]
  before_action :correct_user,   only: [:index, :create]
  
  def index
    @order = CustomerOrder.new
  end

  def new
    @order = CustomerOrder.new
  end
  
  def create
    @order = CustomerOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  def order_params
    params.require(:customer_order).permit(:postal_code, :city, :house_number, :building_name, :phone_number, :shipping_origin_id, :customer_id, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
    
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def signed_in_user
    redirect_to new_user_session_path unless signed_in?
  end

  def correct_user
    set_item
    if @item.user_id == current_user.id || @item.customer
      redirect_to root_path
    end
  end
end