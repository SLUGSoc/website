# frozen_string_literal: true

# Represents one of our game servers. Right now, only those hosted on sleipnir
# are represented.
class Server < ApplicationRecord
  belongs_to :game
  validates :game, presence: true
  validates :port, presence: true,
                   numericality: { greater_than_or_equal_to: 0,
                                   less_than_or_equal_to: 65_535,
                                   only_integer: true }
end
