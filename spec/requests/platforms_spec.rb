require 'rails_helper'

RSpec.describe "Platforms", type: :request do
  describe "GET /platforms" do
    it "works! (now write some real specs)" do
      get platforms_path
      expect(response).to have_http_status(200)
    end
  end
end
