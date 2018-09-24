# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PlatformAccounts', type: :request do
  describe 'GET /platform_accounts' do
    it 'works! (now write some real specs)' do
      get platform_accounts_path
      expect(response).to have_http_status(200)
    end
  end
end
