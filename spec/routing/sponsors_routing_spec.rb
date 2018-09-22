require "rails_helper"

RSpec.describe SponsorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/sponsors").to route_to("sponsors#index")
    end

    it "routes to #new" do
      expect(:get => "/sponsors/new").to route_to("sponsors#new")
    end

    it "routes to #show" do
      expect(:get => "/sponsors/1").to route_to("sponsors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sponsors/1/edit").to route_to("sponsors#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/sponsors").to route_to("sponsors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sponsors/1").to route_to("sponsors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sponsors/1").to route_to("sponsors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sponsors/1").to route_to("sponsors#destroy", :id => "1")
    end
  end
end
