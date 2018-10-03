# frozen_string_literal: true

class Platform < ApplicationRecord
  has_many :releases, dependent: :destroy
  has_many :games, through: :releases
  has_many :platform_accounts, dependent: :destroy
  validates :name, presence: true
  def bootstrap_class
    name.parameterize
  end
end
