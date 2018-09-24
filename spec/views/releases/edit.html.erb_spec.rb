# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'releases/edit', type: :view do
  before(:each) do
    @release = assign(:release, Release.create!(
                                  game: nil,
                                  platform: nil
                                ))
  end

  it 'renders the edit release form' do
    render

    assert_select 'form[action=?][method=?]', release_path(@release), 'post' do
      assert_select 'input[name=?]', 'release[game_id]'

      assert_select 'input[name=?]', 'release[platform_id]'
    end
  end
end
