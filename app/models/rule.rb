# frozen_string_literal: true

# A Rule is one single role in a Code (of conduct). Groups of Rules get rendered
# together at certain locations on the site, such as the LAN page.
class Rule < ApplicationRecord
  belongs_to :code
  validates :summary, presence: true
  validates :full, presence: true
  validates :icon, presence: true
end
