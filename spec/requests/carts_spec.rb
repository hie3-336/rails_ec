require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/carts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/carts/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/carts/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
