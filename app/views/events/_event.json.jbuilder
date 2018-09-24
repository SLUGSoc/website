# frozen_string_literal: true

json.extract! event, :id, :name, :datetime, :location, :lan_number, :facebook_event_id, :ticket_link, :created_at, :updated_at
json.url event_url(event, format: :json)
