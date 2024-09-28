# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :basic_auth

    def index
      @items = Item.all.order(id: :asc)
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to admin_items_url, notice: "商品「#{@item.name}」を登録しました！"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def new
      @item = Item.new
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to admin_items_url, notice: "商品「#{@item.name}」を更新しました！"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      item = Item.find(params[:id])
      item.destroy

      respond_to do |format|
        format.html { redirect_to admin_items_url, notice: "商品「#{item.name}」を削除しました。" }
      end
    end

    private

    def item_params
      params.require(:item).permit(:name, :description, :price, :number, :image)
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
