class Code < ApplicationRecord
  has_many :rules, dependent: :destroy
end
