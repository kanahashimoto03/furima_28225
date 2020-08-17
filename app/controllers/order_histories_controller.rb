class OrderHistoriesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create 
    @order_history = OrderHistory.new(order_history_params)
    if @order_history.valid?
      pay_item
      @order_history.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_history_params
    params.permit().merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_f886e5be26642cddd41ad22a"
    Payjp::Charge.create(
      amount: 999, 
      card: params[:token],
      currency:'jpy'
    )
  end

end
