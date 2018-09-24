# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GameEventRelations', type: :request do
  describe 'GET /game_event_relations' do
    it 'works! (now write some real specs)' do
      get game_event_relations_path
      expect(response).to have_http_status(200)
    end
  end
end
