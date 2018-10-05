# frozen_string_literal: true

# A Game represents a video game. It is linked to which platforms it has been
# released on, which events it has appeared at, and the official website of the
# game itself.
class Game < ApplicationRecord
  has_many :game_event_relations, dependent: :destroy
  has_many :events, through: :game_event_relations
  has_many :releases, dependent: :destroy
  has_many :platforms, through: :releases
  validates :name, presence: true
end
