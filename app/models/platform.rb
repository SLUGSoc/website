# frozen_string_literal: true

# A Platform represents some kind of gaming platform such as a console or web
# service. These are mostly a cosmetic class designed to style games after their
# home console using the colors in app/assets/stylesheets/application.scss.
class Platform < ApplicationRecord
  has_many :releases, dependent: :destroy
  has_many :games, through: :releases
  has_many :platform_accounts, dependent: :destroy
  validates :name, presence: true
  def bootstrap_class
    name.parameterize
  end
end
