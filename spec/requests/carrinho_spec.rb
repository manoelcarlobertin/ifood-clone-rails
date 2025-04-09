require 'rails_helper'

RSpec.describe "Carrinhos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/carrinho/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /add_item" do
    it "returns http success" do
      get "/carrinho/add_item"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /remove_item" do
    it "returns http success" do
      get "/carrinho/remove_item"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /clear" do
    it "returns http success" do
      get "/carrinho/clear"
      expect(response).to have_http_status(:success)
    end
  end

end
