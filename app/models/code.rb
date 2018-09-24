# frozen_string_literal: true

class Code < ApplicationRecord
  has_many :rules, dependent: :destroy
end
