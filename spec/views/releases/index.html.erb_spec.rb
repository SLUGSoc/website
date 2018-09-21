require 'rails_helper'

RSpec.describe "releases/index", type: :view do
  before(:each) do
    assign(:releases, [
      Release.create!(
        :game => nil,
        :platform => nil
      ),
      Release.create!(
        :game => nil,
        :platform => nil
      )
    ])
  end

  it "renders a list of releases" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
