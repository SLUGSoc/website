# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'codes/index', type: :view do
  before(:each) do
    assign(:codes, [
             Code.create!(
               name: 'Name'
             ),
             Code.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of codes' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
