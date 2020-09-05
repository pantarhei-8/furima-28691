class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :set_item,       only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
    def item_params
      params.require(:item).permit(:image, :item_name, :item_text, :category_id, :status_id, :shipping_charger_id, :shipping_origin_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
    end

    def signed_in_user
      redirect_to signin_url unless signed_in?
    end

    def correct_user
      @item = Item.find(params[:id])
      if @item.user_id != current_user.id
        redirect_to root_path 
      end
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
