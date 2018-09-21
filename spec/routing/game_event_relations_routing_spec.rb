require "rails_helper"

RSpec.describe GameEventRelationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/game_event_relations").to route_to("game_event_relations#index")
    end

    it "routes to #new" do
      expect(:get => "/game_event_relations/new").to route_to("game_event_relations#new")
    end

    it "routes to #show" do
      expect(:get => "/game_event_relations/1").to route_to("game_event_relations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/game_event_relations/1/edit").to route_to("game_event_relations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/game_event_relations").to route_to("game_event_relations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/game_event_relations/1").to route_to("game_event_relations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/game_event_relations/1").to route_to("game_event_relations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/game_event_relations/1").to route_to("game_event_relations#destroy", :id => "1")
    end
  end
end
