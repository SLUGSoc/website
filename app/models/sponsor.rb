# frozen_string_literal: true

# A Sponsor represents a sponsor of our society. They have a name and a small
# description detailing what they do as a company and what they do for us as a
# society.
class Sponsor < ApplicationRecord
  validates :name, presence: true
  validates :blurb, presence: true, length: { minimum: 70 }
end
