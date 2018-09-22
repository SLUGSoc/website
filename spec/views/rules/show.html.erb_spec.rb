require 'rails_helper'

RSpec.describe "rules/show", type: :view do
  before(:each) do
    @rule = assign(:rule, Rule.create!(
      :code => nil,
      :summary => "Summary",
      :full => "Full",
      :icon => "Icon"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Summary/)
    expect(rendered).to match(/Full/)
    expect(rendered).to match(/Icon/)
  end
end
