# frozen_string_literal: true

class Release < ApplicationRecord
  belongs_to :game
  belongs_to :platform
end
