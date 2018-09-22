require 'rails_helper'

RSpec.describe "Sponsors", type: :request do
  describe "GET /sponsors" do
    it "works! (now write some real specs)" do
      get sponsors_path
      expect(response).to have_http_status(200)
    end
  end
end
