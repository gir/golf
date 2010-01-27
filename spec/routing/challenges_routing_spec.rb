require 'spec_helper'

describe ChallengesController do
  describe "routing" do
    it "recognizes and generates #index" do
      params_from(:get, "/").should == {:controller => "challenges", :action => "index"}
    end

    it "recognizes and generates #new" do
      { :get => "/challenges/new" }.should route_to(:controller => "challenges", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/challenges/1" }.should route_to(:controller => "challenges", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/challenges/1/edit" }.should route_to(:controller => "challenges", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/challenges" }.should route_to(:controller => "challenges", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/challenges/1" }.should route_to(:controller => "challenges", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/challenges/1" }.should route_to(:controller => "challenges", :action => "destroy", :id => "1") 
    end
  end
end
