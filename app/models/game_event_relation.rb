# frozen_string_literal: true

class GameEventRelation < ApplicationRecord
  belongs_to :game
  validates :game, presence: true
  belongs_to :event
  validates :event, presence: true
end
