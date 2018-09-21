class Event < ApplicationRecord
  has_many :game_event_relations, dependent: :destroy
  has_many :games, through: :game_event_relations
end
