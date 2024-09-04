# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.with_attached_image
    # @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.with_attached_image
  end
end
