require 'rails_helper'

RSpec.describe "servers/new", type: :view do
  before(:each) do
    assign(:server, Server.new(
      :game => nil,
      :port => 1
    ))
  end

  it "renders new server form" do
    render

    assert_select "form[action=?][method=?]", servers_path, "post" do

      assert_select "input[name=?]", "server[game_id]"

      assert_select "input[name=?]", "server[port]"
    end
  end
end
