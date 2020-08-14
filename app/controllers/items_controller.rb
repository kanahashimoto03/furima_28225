class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_description, :item_category_id, :item_condition_id, :delivery_time_id, :shipping_area_id, :shipping_charge_id, :item_price).merge(user_id: current_user.id)
  end

end
