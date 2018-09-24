# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'releases/new', type: :view do
  before(:each) do
    assign(:release, Release.new(
                       game: nil,
                       platform: nil
                     ))
  end

  it 'renders new release form' do
    render

    assert_select 'form[action=?][method=?]', releases_path, 'post' do
      assert_select 'input[name=?]', 'release[game_id]'

      assert_select 'input[name=?]', 'release[platform_id]'
    end
  end
end
