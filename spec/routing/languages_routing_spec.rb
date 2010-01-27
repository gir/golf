require 'spec_helper'

describe LanguagesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/languages" }.should route_to(:controller => "languages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/languages/new" }.should route_to(:controller => "languages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/languages/1" }.should route_to(:controller => "languages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/languages/1/edit" }.should route_to(:controller => "languages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/languages" }.should route_to(:controller => "languages", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/languages/1" }.should route_to(:controller => "languages", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/languages/1" }.should route_to(:controller => "languages", :action => "destroy", :id => "1") 
    end
  end
end
