class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else  
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :item_description, :item_category_id, :item_condition_id, :delivery_time_id, :shipping_area_id, :shipping_charge_id, :item_price).merge(user_id:current_user.id)
  end


end