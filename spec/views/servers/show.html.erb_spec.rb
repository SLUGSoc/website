require 'rails_helper'

RSpec.describe "servers/show", type: :view do
  before(:each) do
    @server = assign(:server, Server.create!(
      :game => nil,
      :port => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
