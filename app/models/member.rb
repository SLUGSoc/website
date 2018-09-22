class Member < ApplicationRecord
  has_many :platform_accounts, dependent: :destroy
end
