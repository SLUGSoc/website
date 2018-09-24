# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              location: 'Location',
                              lan_number: 2,
                              facebook_event_id: 'Facebook Event',
                              ticket_link: 'Ticket Link'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Facebook Event/)
    expect(rendered).to match(/Ticket Link/)
  end
end
