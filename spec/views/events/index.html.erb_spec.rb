# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before(:each) do
    assign(:events, [
             Event.create!(
               location: 'Location',
               lan_number: 2,
               facebook_event_id: 'Facebook Event',
               ticket_link: 'Ticket Link'
             ),
             Event.create!(
               location: 'Location',
               lan_number: 2,
               facebook_event_id: 'Facebook Event',
               ticket_link: 'Ticket Link'
             )
           ])
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Location'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Facebook Event'.to_s, count: 2
    assert_select 'tr>td', text: 'Ticket Link'.to_s, count: 2
  end
end
