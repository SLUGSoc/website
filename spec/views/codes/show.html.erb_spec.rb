# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'codes/show', type: :view do
  before(:each) do
    @code = assign(:code, Code.create!(
                            name: 'Name'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
