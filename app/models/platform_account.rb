# frozen_string_literal: true

# A PlatformAccount represents an account a committee member has on an online
# gaming service such as Steam or Battle.net. This is shown alongside their
# committee profile so that new members can easily get in touch with them.
class PlatformAccount < ApplicationRecord
  belongs_to :platform
  validates :platform, presence: true
  belongs_to :member
  validates :member, presence: true
end
