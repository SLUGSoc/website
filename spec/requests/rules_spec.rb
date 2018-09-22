require 'rails_helper'

RSpec.describe "Rules", type: :request do
  describe "GET /rules" do
    it "works! (now write some real specs)" do
      get rules_path
      expect(response).to have_http_status(200)
    end
  end
end
