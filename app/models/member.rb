# frozen_string_literal: true

# A Member represents a member of the society. Presently, only committee members
# have a place on the site. This model is a small personal profile of a single
# person that's linked to the accounts they have on gaming services.
class Member < ApplicationRecord
  has_many :platform_accounts, dependent: :destroy
  validates :name, presence: true
  validates :role, presence: true
  validates :blurb, presence: true, length: { minimum: 140 }

  def self.committee
    Member.where.not(role: nil)
  end
end
