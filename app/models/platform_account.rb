class PlatformAccount < ApplicationRecord
  belongs_to :platform
  belongs_to :member
end
