class CartsController < ApplicationController

  # before_action :setup_cart_item

  def show
  end

  def my_cart
    @cart_items = current_cart.cart_items
  end

  def add_item
    # if session[:cart_id]
    #   @cart = Cart.find(session[:cart_id])
    # else
    #   @cart = Cart.create
    #   session[:cart_id] = @cart.id
    # end
    if current_cart.cart_items.find_by(item_id: params[:item_id])
      @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    else
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.count ||= 0
    @cart_item.count += 1

    @cart_item.save
  end

  def create
  end

  def destroy
  end

  private
  
  def setup_cart_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

end
