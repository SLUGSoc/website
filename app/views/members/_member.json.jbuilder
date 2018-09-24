# frozen_string_literal: true

json.extract! member, :id, :name, :alias, :role, :blurb, :image_link, :created_at, :updated_at
json.url member_url(member, format: :json)
