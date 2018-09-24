# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'members/edit', type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
                                name: 'MyString',
                                alias: 'MyString',
                                role: 'MyString',
                                blurb: 'MyString',
                                image_link: 'MyString'
                              ))
  end

  it 'renders the edit member form' do
    render

    assert_select 'form[action=?][method=?]', member_path(@member), 'post' do
      assert_select 'input[name=?]', 'member[name]'

      assert_select 'input[name=?]', 'member[alias]'

      assert_select 'input[name=?]', 'member[role]'

      assert_select 'input[name=?]', 'member[blurb]'

      assert_select 'input[name=?]', 'member[image_link]'
    end
  end
end
