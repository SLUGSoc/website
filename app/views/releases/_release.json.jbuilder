# frozen_string_literal: true

json.extract! release, :id, :game_id, :platform_id, :created_at, :updated_at
json.url release_url(release, format: :json)
