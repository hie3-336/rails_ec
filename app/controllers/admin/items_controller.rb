# frozen_string_literal: true

class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
