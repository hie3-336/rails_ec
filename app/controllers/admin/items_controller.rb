# frozen_string_literal: true

class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
