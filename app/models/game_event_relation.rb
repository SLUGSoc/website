# frozen_string_literal: true

# Signifies that a game has appeared (or will appear) at a particular event.
class GameEventRelation < ApplicationRecord
  belongs_to :game
  validates :game, presence: true
  belongs_to :event
  validates :event, presence: true
end
