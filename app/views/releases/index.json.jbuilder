# frozen_string_literal: true

json.array! @releases, partial: 'releases/release', as: :release
