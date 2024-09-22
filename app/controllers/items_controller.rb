# frozen_string_literal: true

class ItemsController < ApplicationController
  # before_action :setup_cart_item

  def index
    @items = Item.with_attached_image
    # @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.with_attached_image
  end

  private

  def setup_cart_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

end
