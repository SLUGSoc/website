# frozen_string_literal: true

json.extract! code, :id, :name, :created_at, :updated_at
json.url code_url(code, format: :json)
