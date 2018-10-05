# frozen_string_literal: true

# A Code (of conduct) defines a group of rules relating to some topic, such as
# conduct at events.
class Code < ApplicationRecord
  has_many :rules, dependent: :destroy
end
