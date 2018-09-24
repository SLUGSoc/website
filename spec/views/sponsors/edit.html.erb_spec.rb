# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sponsors/edit', type: :view do
  before(:each) do
    @sponsor = assign(:sponsor, Sponsor.create!(
                                  name: 'MyString',
                                  website: 'MyString',
                                  blurb: 'MyString',
                                  facebook: 'MyString',
                                  twitter: 'MyString',
                                  image_link: 'MyString'
                                ))
  end

  it 'renders the edit sponsor form' do
    render

    assert_select 'form[action=?][method=?]', sponsor_path(@sponsor), 'post' do
      assert_select 'input[name=?]', 'sponsor[name]'

      assert_select 'input[name=?]', 'sponsor[website]'

      assert_select 'input[name=?]', 'sponsor[blurb]'

      assert_select 'input[name=?]', 'sponsor[facebook]'

      assert_select 'input[name=?]', 'sponsor[twitter]'

      assert_select 'input[name=?]', 'sponsor[image_link]'
    end
  end
end
