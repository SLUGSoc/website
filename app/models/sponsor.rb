# frozen_string_literal: true

class Sponsor < ApplicationRecord
  validates :name, presence: true
  validates :blurb, presence: true, length: { minimum: 70 }
end
