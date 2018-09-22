require "rails_helper"

RSpec.describe CodesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/codes").to route_to("codes#index")
    end

    it "routes to #new" do
      expect(:get => "/codes/new").to route_to("codes#new")
    end

    it "routes to #show" do
      expect(:get => "/codes/1").to route_to("codes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/codes/1/edit").to route_to("codes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/codes").to route_to("codes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/codes/1").to route_to("codes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/codes/1").to route_to("codes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/codes/1").to route_to("codes#destroy", :id => "1")
    end
  end
end
