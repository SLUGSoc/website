# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rules/index', type: :view do
  before(:each) do
    assign(:rules, [
             Rule.create!(
               code: nil,
               summary: 'Summary',
               full: 'Full',
               icon: 'Icon'
             ),
             Rule.create!(
               code: nil,
               summary: 'Summary',
               full: 'Full',
               icon: 'Icon'
             )
           ])
  end

  it 'renders a list of rules' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Summary'.to_s, count: 2
    assert_select 'tr>td', text: 'Full'.to_s, count: 2
    assert_select 'tr>td', text: 'Icon'.to_s, count: 2
  end
end
