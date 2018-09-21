require 'rails_helper'

RSpec.describe "releases/show", type: :view do
  before(:each) do
    @release = assign(:release, Release.create!(
      :game => nil,
      :platform => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
