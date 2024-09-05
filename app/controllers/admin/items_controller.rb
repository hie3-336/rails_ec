# frozen_string_literal: true

class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_items_url, notice: "商品「#{item.name}」を登録しました！"
    end

  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to admin_items_url, notice: "商品「#{item.name}」を更新しました！"
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :number, :image)
  end
end
