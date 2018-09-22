require 'rails_helper'

RSpec.describe "platform_accounts/new", type: :view do
  before(:each) do
    assign(:platform_account, PlatformAccount.new(
      :platform => nil,
      :member => nil,
      :tag => "MyString",
      :internal_link => "MyString"
    ))
  end

  it "renders new platform_account form" do
    render

    assert_select "form[action=?][method=?]", platform_accounts_path, "post" do

      assert_select "input[name=?]", "platform_account[platform_id]"

      assert_select "input[name=?]", "platform_account[member_id]"

      assert_select "input[name=?]", "platform_account[tag]"

      assert_select "input[name=?]", "platform_account[internal_link]"
    end
  end
end
