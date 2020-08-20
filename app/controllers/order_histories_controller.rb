class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if @item.order_history.present? or @item.user_id == current_user.id
      redirect_to root_path
    end
    @order = Order.new
  end

  def create 
    @order = Order.new(order_history_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_history_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id]) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price, 
      card: params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
