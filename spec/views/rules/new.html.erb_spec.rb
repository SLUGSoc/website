require 'rails_helper'

RSpec.describe "rules/new", type: :view do
  before(:each) do
    assign(:rule, Rule.new(
      :code => nil,
      :summary => "MyString",
      :full => "MyString",
      :icon => "MyString"
    ))
  end

  it "renders new rule form" do
    render

    assert_select "form[action=?][method=?]", rules_path, "post" do

      assert_select "input[name=?]", "rule[code_id]"

      assert_select "input[name=?]", "rule[summary]"

      assert_select "input[name=?]", "rule[full]"

      assert_select "input[name=?]", "rule[icon]"
    end
  end
end
