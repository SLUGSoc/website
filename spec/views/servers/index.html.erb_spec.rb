require 'rails_helper'

RSpec.describe "servers/index", type: :view do
  before(:each) do
    assign(:servers, [
      Server.create!(
        :game => nil,
        :port => 2
      ),
      Server.create!(
        :game => nil,
        :port => 2
      )
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
