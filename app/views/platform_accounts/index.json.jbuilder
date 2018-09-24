# frozen_string_literal: true

json.array! @platform_accounts, partial: 'platform_accounts/platform_account', as: :platform_account
