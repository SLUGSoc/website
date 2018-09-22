require 'rails_helper'

RSpec.describe "platform_accounts/edit", type: :view do
  before(:each) do
    @platform_account = assign(:platform_account, PlatformAccount.create!(
      :platform => nil,
      :member => nil,
      :tag => "MyString",
      :internal_link => "MyString"
    ))
  end

  it "renders the edit platform_account form" do
    render

    assert_select "form[action=?][method=?]", platform_account_path(@platform_account), "post" do

      assert_select "input[name=?]", "platform_account[platform_id]"

      assert_select "input[name=?]", "platform_account[member_id]"

      assert_select "input[name=?]", "platform_account[tag]"

      assert_select "input[name=?]", "platform_account[internal_link]"
    end
  end
end
