require "spec_helper"

describe AnalyticsController do
  describe "routing" do

    it "routes to #index" do
      get("/analytics").should route_to("analytics#index")
    end

    it "routes to #new" do
      get("/analytics/new").should route_to("analytics#new")
    end

    it "routes to #show" do
      get("/analytics/1").should route_to("analytics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/analytics/1/edit").should route_to("analytics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/analytics").should route_to("analytics#create")
    end

    it "routes to #update" do
      put("/analytics/1").should route_to("analytics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/analytics/1").should route_to("analytics#destroy", :id => "1")
    end

  end
end
