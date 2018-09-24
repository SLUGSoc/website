# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'platform_accounts/index', type: :view do
  before(:each) do
    assign(:platform_accounts, [
             PlatformAccount.create!(
               platform: nil,
               member: nil,
               tag: 'Tag',
               internal_link: 'Internal Link'
             ),
             PlatformAccount.create!(
               platform: nil,
               member: nil,
               tag: 'Tag',
               internal_link: 'Internal Link'
             )
           ])
  end

  it 'renders a list of platform_accounts' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Tag'.to_s, count: 2
    assert_select 'tr>td', text: 'Internal Link'.to_s, count: 2
  end
end
