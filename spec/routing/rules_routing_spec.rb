require "rails_helper"

RSpec.describe RulesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/rules").to route_to("rules#index")
    end

    it "routes to #new" do
      expect(:get => "/rules/new").to route_to("rules#new")
    end

    it "routes to #show" do
      expect(:get => "/rules/1").to route_to("rules#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rules/1/edit").to route_to("rules#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/rules").to route_to("rules#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rules/1").to route_to("rules#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rules/1").to route_to("rules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rules/1").to route_to("rules#destroy", :id => "1")
    end
  end
end
