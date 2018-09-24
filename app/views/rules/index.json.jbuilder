# frozen_string_literal: true

json.array! @rules, partial: 'rules/rule', as: :rule
