class Game < ApplicationRecord
  has_many :game_event_relations, dependent: :destroy
  has_many :events, through: :game_event_relations
end
