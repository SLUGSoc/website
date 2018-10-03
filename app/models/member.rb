# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :platform_accounts, dependent: :destroy
  validates :name, presence: true
  validates :role, presence: true
  validates :blurb, presence: true, length: { minimum: 140 }

  def self.committee
    Member.where.not(role: nil)
  end
end
