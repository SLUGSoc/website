# frozen_string_literal: true

json.extract! game_event_relation, :id, :game_id, :event_id, :created_at, :updated_at
json.url game_event_relation_url(game_event_relation, format: :json)
