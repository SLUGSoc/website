require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :name => "Name",
        :platform => "Platform",
        :link => "Link"
      ),
      Game.create!(
        :name => "Name",
        :platform => "Platform",
        :link => "Link"
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Platform".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
