# frozen_string_literal: true

class GameEventRelation < ApplicationRecord
  belongs_to :game
  belongs_to :event
end
