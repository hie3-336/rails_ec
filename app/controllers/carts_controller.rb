# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_and_coupon, only: %i[my_cart checkout]

  def my_cart
    @purchase = Purchase.new
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

    redirect_to my_cart_path, notice: invalid_coupon_message(@coupon) and return if invalid_coupon?(@coupon)

    @coupon.cart_id = current_cart.id
    if @coupon.save
      redirect_to request.referer, notice: 'クーポンコードを適用しました。'
    else
      redirect_to request.referer, notice: 'クーポンコード適用に失敗しました。'
    end
  end

  def checkout
    @purchase = Purchase.new(purchase_params)
    @purchase.cart_id = current_cart.id
    @purchase.total_price = @total_price

    @cart_items.each do |cart_item|
      @purchase.purchase_ditails.build(name: cart_item.item.name, price: cart_item.item.price, count: cart_item.count)
    end

    if @purchase.purchase_ditails == []
      flash.now[:notice] = 'カートには少なくとも商品を一つ追加してください。'
      render :my_cart, status: :unprocessable_entity and return
    end

    if @purchase.save
      CheckoutMailer.ordermail(@purchase).deliver_now

      # クーポンが適用されているときは「使用済み」にする
      @coupon.update(is_used: true) if @coupon.present?

      session.delete(:cart_id)
      redirect_to root_path, notice: '商品購入ありがとうございます！'
    else
      render :my_cart, status: :unprocessable_entity, notice: '商品購入に失敗しました。'
    end
  end

  private

  def set_cart_and_coupon
    @cart_items = current_cart.cart_items.includes(:item)
    @coupon = current_cart.coupon

    # 以下、合計金額算出部分
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price * cart_item.count
    end

    return if @coupon.blank?

    @total_price -= @coupon.discount
    @total_price = 0 if @total_price.negative?
  end

  def current_cart
    current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = current_cart.id
    current_cart
  end

  # Rubocopの指摘対応のため、クーポンエラー対応部分を切り出し
  def invalid_coupon?(coupon)
    coupon.nil? || coupon.is_used || coupon.cart_id.present?
  end

  def invalid_coupon_message(coupon)
    return 'クーポンコードが誤っております。' if coupon.nil?
    return 'このクーポンコードはすでに使用されております。' if coupon.is_used

    'すでにクーポンコードが適用されております。' if coupon.cart_id.present?
  end

  def purchase_params
    params.require(:purchase).permit(:first_name, :last_name, :user_name, :mail, :address, :apart, :card_name,
                                     :card_number, :card_expiration, :card_cvv)
  end
end
