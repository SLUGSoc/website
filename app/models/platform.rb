class Platform < ApplicationRecord
  has_many :releases, dependent: :destroy
  has_many :games, through: :releases
end
