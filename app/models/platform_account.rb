# frozen_string_literal: true

class PlatformAccount < ApplicationRecord
  belongs_to :platform
  belongs_to :member
end
