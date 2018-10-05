# frozen_string_literal: true

# A Release indicates a platform that a particular game has been released on.
class Release < ApplicationRecord
  belongs_to :game
  validates :game, presence: true
  belongs_to :platform
  validates :platform, presence: true
end
