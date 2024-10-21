# frozen_string_literal: true

class CartsController < ApplicationController
  def my_cart
    @purchase = Purchase.new
    @cart_items = current_cart.cart_items.includes(:item)
    @coupon = Coupon.find_by(cart_id: current_cart.id)
  end

  def add_item
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

  def apply_coupon
    @coupon = Coupon.find_by(code: params[:code])

    if @coupon.nil?
      redirect_to my_cart_path, notice: 'クーポンコードが誤っております。' and return
    end

    if @coupon.use == "used"
      redirect_to my_cart_path, notice: 'このクーポンコードはすでに使用されております。' and return
    end

    if @coupon.cart_id.present?
      redirect_to my_cart_path, notice: 'すでにクーポンコードが適用されております。' and return
    end

    @coupon.cart_id = current_cart.id
    if @coupon.save
      redirect_to request.referer, notice: 'クーポンコードを適用しました。'
    else
      redirect_to request.referer, notice: 'クーポンコード適用に失敗しました。'
    end

  end

  def checkout
    @purchase = Purchase.new(purchase_params)
    @cart_items = current_cart.cart_items.includes(:item)
    @coupon = Coupon.find_by(cart_id: current_cart.id)
    @cart_items.each do |cart_item|
      @purchase.purchase_ditails.build(name: cart_item.item.name, price: cart_item.item.price, count: cart_item.count)
    end

    if @purchase.purchase_ditails == []
      flash.now[:notice] = 'カートには少なくとも商品を一つ追加してください。'
      render :my_cart, status: :unprocessable_entity and return
    end

    if @purchase.save
      CheckoutMailer.ordermail(@purchase).deliver_now
      # current_cart.destroy
      if @coupon.present?
        @coupon.use = "used"
        @coupon.save
      end
      
      session.delete(:cart_id)
      redirect_to root_path, notice: '商品購入ありがとうございます！'
    else
      render :my_cart, status: :unprocessable_entity, notice: '商品購入に失敗しました。'
    end
  end

  private

  def current_cart
    current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = current_cart.id
    current_cart
  end

  def purchase_params
    params.require(:purchase).permit(:first_name, :last_name, :user_name, :mail, :address, :apart, :card_name,
                                     :card_number, :card_expiration, :card_cvv)
  end
end