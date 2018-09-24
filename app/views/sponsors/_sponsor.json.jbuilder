# frozen_string_literal: true

json.extract! sponsor, :id, :name, :website, :blurb, :facebook, :twitter, :image_link, :created_at, :updated_at
json.url sponsor_url(sponsor, format: :json)
