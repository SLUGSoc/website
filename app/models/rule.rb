# frozen_string_literal: true

class Rule < ApplicationRecord
  belongs_to :code
  validates :summary, presence: true
  validates :full, presence: true
  validates :icon, presence: true
end
