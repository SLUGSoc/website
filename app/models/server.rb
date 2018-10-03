class Server < ApplicationRecord
  belongs_to :game
  validates :game, presence: true
  validates :port, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 65535,  only_integer: true }
end
