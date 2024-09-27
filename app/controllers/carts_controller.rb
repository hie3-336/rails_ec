class CartsController < ApplicationController

  before_action :setup_cart_item , only: %i[add_item]

  def show
  end

  def my_cart
    @cart_items = current_cart.cart_items.includes(:item)
  end

  def add_item
    @cart_item ||= current_cart.cart_items.build(item_id: params[:item_id])
    @cart_item.count ||= 0
    @cart_item.count += params[:add_item_count].to_i
    @cart_item.save

  end

  def create
  end

  def delete_cart
    if current_cart.destroy
      redirect_to my_cart_path, notice: "カートの中身を削除しました。"
    else
      redirect_to my_cart_path, notice: "カート削除に失敗しました。"
    end
  end

  private
  
  def setup_cart_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

end
