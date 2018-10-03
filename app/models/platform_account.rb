# frozen_string_literal: true

class PlatformAccount < ApplicationRecord
  belongs_to :platform
  validates :platform, presence: true
  belongs_to :member
  validates :member, presence: true
end
