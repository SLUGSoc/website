# frozen_string_literal: true

class Release < ApplicationRecord
  belongs_to :game
  validates :game, presence: true
  belongs_to :platform
  validates :platform, presence: true
end
