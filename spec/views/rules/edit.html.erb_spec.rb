require 'rails_helper'

RSpec.describe "rules/edit", type: :view do
  before(:each) do
    @rule = assign(:rule, Rule.create!(
      :code => nil,
      :summary => "MyString",
      :full => "MyString",
      :icon => "MyString"
    ))
  end

  it "renders the edit rule form" do
    render

    assert_select "form[action=?][method=?]", rule_path(@rule), "post" do

      assert_select "input[name=?]", "rule[code_id]"

      assert_select "input[name=?]", "rule[summary]"

      assert_select "input[name=?]", "rule[full]"

      assert_select "input[name=?]", "rule[icon]"
    end
  end
end
