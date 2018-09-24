# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sponsors/new', type: :view do
  before(:each) do
    assign(:sponsor, Sponsor.new(
                       name: 'MyString',
                       website: 'MyString',
                       blurb: 'MyString',
                       facebook: 'MyString',
                       twitter: 'MyString',
                       image_link: 'MyString'
                     ))
  end

  it 'renders new sponsor form' do
    render

    assert_select 'form[action=?][method=?]', sponsors_path, 'post' do
      assert_select 'input[name=?]', 'sponsor[name]'

      assert_select 'input[name=?]', 'sponsor[website]'

      assert_select 'input[name=?]', 'sponsor[blurb]'

      assert_select 'input[name=?]', 'sponsor[facebook]'

      assert_select 'input[name=?]', 'sponsor[twitter]'

      assert_select 'input[name=?]', 'sponsor[image_link]'
    end
  end
end
