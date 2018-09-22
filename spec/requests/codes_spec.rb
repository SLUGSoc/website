require 'rails_helper'

RSpec.describe "Codes", type: :request do
  describe "GET /codes" do
    it "works! (now write some real specs)" do
      get codes_path
      expect(response).to have_http_status(200)
    end
  end
end
