class Platform < ApplicationRecord
  has_many :releases, dependent: :destroy
  has_many :games, through: :releases
  has_many :platform_accounts, dependent: :destroy
  def bootstrap_class
    name.parameterize
  end
end
