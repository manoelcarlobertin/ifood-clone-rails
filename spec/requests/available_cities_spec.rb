require 'rails_helper'

RSpec.describe "AvailableCities", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/available_cities/index"
      expect(response).to have_http_status(:success)
    end
  end

end
