# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :game_event_relations, dependent: :destroy
  has_many :events, through: :game_event_relations
  has_many :releases, dependent: :destroy
  has_many :platforms, through: :releases
end
