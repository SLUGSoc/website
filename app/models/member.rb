# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :platform_accounts, dependent: :destroy

  def self.committee
    Member.where.not(role: nil)
  end
end
