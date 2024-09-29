# frozen_string_literal: true

class CartsController < ApplicationController
  def my_cart
    @cart_items = current_cart.cart_items.includes(:item)
  end

  def add_item
    # @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    # @cart_item ||= current_cart.cart_items.build(item_id: params[:item_id])
    @cart_item ||= current_cart.cart_items.find_or_initialize_by(item_id: params[:item_id])
    @cart_item.count ||= 0
    @cart_item.count += params[:add_item_count].to_i
    if @cart_item.save
      redirect_to request.referer, notice: '商品をカートに追加しました。'
    else
      redirect_to request.referer, notice: 'カートの商品追加に失敗しました。'
    end
  end

  def delete_cart
    if current_cart.destroy
      redirect_to my_cart_path, notice: 'カートの中身を削除しました。'
    else
      redirect_to my_cart_path, notice: 'カート削除に失敗しました。'
    end
  end

  private

  def current_cart
    # current_cart = Cart.find_by(id: session[:cart_id])
    # current_cart ||= Cart.create
    current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = current_cart.id
    current_cart
  end
end
