# frozen_string_literal: true

module Admin
  class PurchasesController < ApplicationController
    before_action :basic_auth

    def index
      @purchases = Purchase.all.order(id: :asc)
    end

    def show
      @purchase = Purchase.includes(:purchase_ditails).find(params[:id])
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
