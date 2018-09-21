require 'rails_helper'

RSpec.describe "game_event_relations/edit", type: :view do
  before(:each) do
    @game_event_relation = assign(:game_event_relation, GameEventRelation.create!(
      :game => nil,
      :event => nil
    ))
  end

  it "renders the edit game_event_relation form" do
    render

    assert_select "form[action=?][method=?]", game_event_relation_path(@game_event_relation), "post" do

      assert_select "input[name=?]", "game_event_relation[game_id]"

      assert_select "input[name=?]", "game_event_relation[event_id]"
    end
  end
end
